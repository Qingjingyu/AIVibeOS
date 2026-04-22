#!/usr/bin/env bash
set -euo pipefail

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
repo_root="$(cd "$script_dir/../.." && pwd)"
target_dir="${1:-.}"
output_file="${2:-}"
scan_profile="${3:-auto}"
valid_profiles="auto docs project"

is_valid_profile() {
  local value="${1:-}"
  [[ " $valid_profiles " == *" $value "* ]]
}

if [[ -n "$output_file" && -z "${3:-}" ]] && is_valid_profile "$output_file"; then
  scan_profile="$output_file"
  output_file=""
fi

if [[ "${target_dir}" == "-h" || "${target_dir}" == "--help" ]]; then
  cat <<'EOF'
Usage:
  phase-check.sh [target-dir] [output-file] [scan-profile]

Example:
  phase-check.sh .
  phase-check.sh /path/to/project/docs
  phase-check.sh /path/to/project project
  phase-check.sh /path/to/project/docs /tmp/phase-check-report.txt
  phase-check.sh /path/to/project /tmp/phase-check-report.txt project

If output-file is omitted:
  The script writes to AIVibe fixed output dir under 治理输出/phase-check/

Scan profile:
  auto     自动判断，默认
  docs      只把 target-dir 当文档目录扫描
  project   把 target-dir 当项目根目录扫描，优先看 docs/ 和根 README
EOF
  exit 0
fi

if [[ ! -d "$target_dir" ]]; then
  echo "Error: directory not found: $target_dir" >&2
  exit 1
fi

if ! command -v rg >/dev/null 2>&1; then
  echo "Error: rg not found. Install ripgrep first." >&2
  exit 1
fi

if [[ "$scan_profile" != "auto" && "$scan_profile" != "docs" && "$scan_profile" != "project" ]]; then
  echo "Error: invalid scan profile: $scan_profile" >&2
  echo "Use: auto, docs, or project" >&2
  exit 1
fi

report_buffer=""
search_files=""
default_output_dir="$repo_root/治理输出/phase-check"
resolved_output_file=""
latest_output_file=""

append_line() {
  local line="${1:-}"
  report_buffer+="${line}"$'\n'
}

resolve_profile() {
  if [[ "$scan_profile" == "docs" || "$scan_profile" == "project" ]]; then
    echo "$scan_profile"
    return
  fi

  if [[ -d "$target_dir/docs" ]]; then
    echo "project"
  else
    echo "docs"
  fi
}

resolved_profile="$(resolve_profile)"

build_search_files() {
  if [[ "$resolved_profile" == "project" ]]; then
    local doc_roots=(
      "$target_dir/docs"
      "$target_dir/开发过程"
      "$target_dir/02_Spec模板"
      "$target_dir/03_QA与验收"
      "$target_dir/04_学习资料"
    )

    for root in "${doc_roots[@]}"; do
      if [[ -d "$root" ]]; then
        rg --files "$root" || true
      fi
    done

    if [[ -f "$target_dir/README.md" ]]; then
      echo "README.md"
    fi
  else
    rg --files "$target_dir" || true
  fi
}

search_files="$(build_search_files)"

check_group() {
  local label="$1"
  local pattern="$2"
  local matches
  matches="$(printf '%s\n' "$search_files" | rg -i "$pattern" || true)"

  if [[ -n "$matches" ]]; then
    append_line "[OK] $label"
    while read -r match; do
      [[ -n "$match" ]] && append_line "  - $match"
    done <<< "$matches"
    return 0
  fi

  append_line "[MISSING] $label"
  return 1
}

append_line "AIVibe Phase Check"
append_line "Target: $target_dir"
append_line "Scan Profile: $resolved_profile"
append_line ""

research_ok=0
proposal_ok=0
spec_ok=0
design_ok=0
tasks_ok=0
qa_ok=0
release_ok=0
readme_ok=0

check_group "Research" '(research|研究|调研)' && research_ok=1 || true
append_line ""
check_group "Proposal" '(proposal|提案)' && proposal_ok=1 || true
append_line ""
check_group "Spec" '(spec|需求)' && spec_ok=1 || true
append_line ""
check_group "Design" '(design|设计)' && design_ok=1 || true
append_line ""
check_group "Tasks" '(tasks|任务)' && tasks_ok=1 || true
append_line ""
check_group "QA" '(qa|测试)' && qa_ok=1 || true
append_line ""
check_group "Release / Rollback" '(release|发布|回滚)' && release_ok=1 || true
append_line ""
check_group "README" '(^|/)README\.md$' && readme_ok=1 || true
append_line ""

phase_status() {
  local label="$1"
  local value="$2"
  if [[ "$value" -eq 1 ]]; then
    append_line "[READY] $label"
  else
    append_line "[NOT READY] $label"
  fi
}

planning_ready=0
handoff_ready=0

if [[ $proposal_ok -eq 1 && $spec_ok -eq 1 && $design_ok -eq 1 && $tasks_ok -eq 1 ]]; then
  planning_ready=1
fi

if [[ $qa_ok -eq 1 && $release_ok -eq 1 && $readme_ok -eq 1 ]]; then
  handoff_ready=1
fi

append_line "Phase Summary"
phase_status "Discovery" "$research_ok"
phase_status "Planning" "$planning_ready"
phase_status "Polish / QA" "$qa_ok"
phase_status "Handoff" "$handoff_ready"

append_line ""
append_line "Missing Next Actions"
[[ $research_ok -eq 0 ]] && append_line "- Add research input or market/problem notes."
[[ $proposal_ok -eq 0 ]] && append_line "- Add a Proposal document."
[[ $spec_ok -eq 0 ]] && append_line "- Add a Spec document."
[[ $design_ok -eq 0 ]] && append_line "- Add a Design document."
[[ $tasks_ok -eq 0 ]] && append_line "- Add a Tasks document."
[[ $qa_ok -eq 0 ]] && append_line "- Add a QA record or checklist."
[[ $release_ok -eq 0 ]] && append_line "- Add a Release / Rollback record."
[[ $readme_ok -eq 0 ]] && append_line "- Add a README for handoff."

printf '%s' "$report_buffer"

if [[ -z "$output_file" ]]; then
  mkdir -p "$default_output_dir"
  timestamp="$(date '+%Y%m%d-%H%M%S')"
  resolved_output_file="$default_output_dir/phase-check-$timestamp.txt"
  latest_output_file="$default_output_dir/latest.txt"
else
  resolved_output_file="$output_file"
fi

mkdir -p "$(dirname "$resolved_output_file")"
printf '%s' "$report_buffer" > "$resolved_output_file"

if [[ -n "$latest_output_file" ]]; then
  cp "$resolved_output_file" "$latest_output_file"
fi

echo
echo "Report written to: $resolved_output_file"
if [[ -n "$latest_output_file" ]]; then
  echo "Latest report updated: $latest_output_file"
fi
