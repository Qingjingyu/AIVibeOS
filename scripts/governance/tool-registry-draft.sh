#!/usr/bin/env bash
set -euo pipefail

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
repo_root="$(cd "$script_dir/../.." && pwd)"
target_dir="${1:-.}"
output_file="${2:-}"
scan_mode="${3:-formal}"
output_format="${4:-sections}"
default_output_dir="$repo_root/治理输出/tool-registry"
resolved_output_file=""
latest_output_file=""
valid_scan_modes="formal all"
valid_output_formats="sections table"

is_valid_scan_mode() {
  local value="${1:-}"
  [[ " $valid_scan_modes " == *" $value "* ]]
}

is_valid_output_format() {
  local value="${1:-}"
  [[ " $valid_output_formats " == *" $value "* ]]
}

if [[ -n "$output_file" && -z "${3:-}" ]] && is_valid_scan_mode "$output_file"; then
  scan_mode="$output_file"
  output_file=""
fi

if [[ -n "$output_file" && -z "${3:-}" ]] && is_valid_output_format "$output_file"; then
  output_format="$output_file"
  output_file=""
fi

if [[ -n "$output_file" && -n "${3:-}" && -z "${4:-}" ]] && is_valid_scan_mode "$output_file" && is_valid_output_format "$scan_mode"; then
  output_format="$scan_mode"
  scan_mode="$output_file"
  output_file=""
fi

if [[ "$target_dir" == "-h" || "$target_dir" == "--help" ]]; then
  cat <<'EOF'
Usage:
  tool-registry-draft.sh [target-dir] [output-file] [scan-mode] [output-format]

Example:
  bash ./scripts/governance/tool-registry-draft.sh .
  bash ./scripts/governance/tool-registry-draft.sh . formal table
  bash ./scripts/governance/tool-registry-draft.sh . /tmp/tool-registry-draft.md
  bash ./scripts/governance/tool-registry-draft.sh . /tmp/tool-registry-draft.md all
  bash ./scripts/governance/tool-registry-draft.sh . /tmp/tool-registry-table.md formal table

If output-file is omitted:
  The script writes to AIVibe fixed output dir under 治理输出/tool-registry/

Scan mode:
  formal   只扫描正式资产，默认
  all      扫描仓内所有 SKILL.md

Output format:
  sections  分段列表，默认
  table     Markdown 表格
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

if [[ "$scan_mode" != "formal" && "$scan_mode" != "all" ]]; then
  echo "Error: invalid scan mode: $scan_mode" >&2
  echo "Use: formal or all" >&2
  exit 1
fi

if [[ "$output_format" != "sections" && "$output_format" != "table" ]]; then
  echo "Error: invalid output format: $output_format" >&2
  echo "Use: sections or table" >&2
  exit 1
fi

repo_rel() {
  local root="$1"
  local path="$2"
  path="${path#$root/}"
  echo "$path"
}

top_ability_status() {
  local dir="$1"
  local has_readme=0
  local has_skill=0
  local has_examples=0
  local has_doc=0

  [[ -f "$dir/README.md" ]] && has_readme=1
  [[ -f "$dir/SKILL.md" ]] && has_skill=1
  [[ -d "$dir/examples" ]] && find "$dir/examples" -type f | grep -q . && has_examples=1
  [[ -d "$dir/doc" ]] && find "$dir/doc" -type f | grep -q . && has_doc=1

  if [[ $has_readme -eq 1 && $has_skill -eq 1 && $has_examples -eq 1 && $has_doc -eq 1 ]]; then
    echo "已成型"
    return
  fi

  if [[ $has_readme -eq 1 && $has_skill -eq 1 ]]; then
    echo "已落地"
    return
  fi

  echo "待补"
}

top_ability_notes() {
  local dir="$1"
  local notes=()

  [[ -f "$dir/README.md" ]] && notes+=("README")
  [[ -f "$dir/SKILL.md" ]] && notes+=("SKILL")
  [[ -d "$dir/examples" ]] && find "$dir/examples" -type f | grep -q . && notes+=("examples")
  [[ -d "$dir/doc" ]] && find "$dir/doc" -type f | grep -q . && notes+=("doc")

  if [[ ${#notes[@]} -eq 0 ]]; then
    echo "结构待补"
    return
  fi

  printf '具备 %s' "$(IFS=' / '; echo "${notes[*]}")"
}

script_status() {
  local rel="$1"

  case "$rel" in
    scripts/qa/capture-page.sh) echo "已验证" ;;
    scripts/governance/phase-check.sh) echo "已验证" ;;
    scripts/governance/tool-registry-draft.sh) echo "已验证" ;;
    scripts/governance/update-bootstrap-board.sh) echo "已验证" ;;
    scripts/governance/run-aivibe-closeout.sh) echo "已验证" ;;
    *) echo "已落地" ;;
  esac
}

script_notes() {
  local rel="$1"

  case "$rel" in
    scripts/qa/capture-page.sh) echo "页面截图，已验证公开页面输出" ;;
    scripts/governance/phase-check.sh) echo "阶段检查，支持报告文件与 project 模式" ;;
    scripts/governance/tool-registry-draft.sh) echo "工具台账草稿，支持 formal/all 与 table 输出" ;;
    scripts/governance/update-bootstrap-board.sh) echo "自举看板快照，支持默认回写 latest.md" ;;
    scripts/governance/run-aivibe-closeout.sh) echo "固定收尾总入口，串起 phase-check、tool-registry、bootstrap-board" ;;
    *) echo "待补" ;;
  esac
}

skill_status() {
  local rel="$1"

  case "$rel" in
    Top能力/*/SKILL.md) echo "已绑定 Top能力" ;;
    skills/*/SKILL.md) echo "已落地" ;;
    *) echo "待补" ;;
  esac
}

skill_notes() {
  local rel="$1"

  case "$rel" in
    Top能力/*/SKILL.md) echo "作为 Top能力 的 Agent 入口" ;;
    skills/*/SKILL.md) echo "AIVibe 正式 Skill 入口" ;;
    *) echo "待补" ;;
  esac
}

adapter_status() {
  local rel="$1"

  case "$rel" in
    AGENTS.md) echo "已落地" ;;
    CLAUDE.md) echo "已落地" ;;
    .claude/README.md) echo "已落地" ;;
    .claude/rules/*) echo "已落地" ;;
    .claude/skills/*) echo "已落地" ;;
    .claude/agents/*) echo "已落地" ;;
    .cursor/rules/*) echo "已落地" ;;
    .cursor/commands/*) echo "已落地" ;;
    *) echo "待补" ;;
  esac
}

adapter_notes() {
  local rel="$1"

  case "$rel" in
    AGENTS.md) echo "跨工具 root rules 入口" ;;
    CLAUDE.md) echo "Claude Code root adapter" ;;
    .claude/README.md) echo "Claude 项目级适配说明" ;;
    .claude/rules/*) echo "Claude Code 持久规则层" ;;
    .claude/skills/*) echo "Claude 项目级 skill 入口" ;;
    .claude/agents/*) echo "Claude 项目级 subagent 入口" ;;
    .cursor/rules/*) echo "Cursor 项目规则层" ;;
    .cursor/commands/*) echo "Cursor 命令适配层" ;;
    *) echo "待补" ;;
  esac
}

adapter_label() {
  local rel="$1"
  local base
  base="$(basename "$rel")"

  case "$rel" in
    .claude/skills/*/SKILL.md) basename "$(dirname "$rel")" ;;
    .claude/agents/*.md) basename "$rel" .md ;;
    .cursor/commands/*.md) basename "$rel" .md ;;
    .claude/rules/*) basename "$rel" ;;
    .cursor/rules/*) basename "$rel" ;;
    *) echo "$base" ;;
  esac
}

emit_header() {
  local root="$1"

  echo "# 工具与依赖草稿"
  echo
  echo "生成时间：$(date '+%Y-%m-%d %H:%M:%S')"
  echo "扫描目录：$root"
  echo "扫描模式：$scan_mode"
  echo "输出格式：$output_format"
  echo
  echo "这是一份草稿，用于补全工具总表。"
  echo
}

emit_top_ability_sections() {
  local root="$1"

  echo "## 扫描到的 Top能力"
  echo
  if [[ -d "$root/Top能力" ]]; then
    find "$root/Top能力" -mindepth 1 -maxdepth 1 -type d | sort | while read -r dir; do
      name="$(basename "$dir")"
      echo "### $name"
      echo
      echo "- 类型：Top能力"
      echo "- 主要入口：${dir#$root/}/README.md"
      if [[ -f "$dir/SKILL.md" ]]; then
        echo "- Agent 入口：${dir#$root/}/SKILL.md"
      else
        echo "- Agent 入口：无"
      fi
      echo "- 当前状态：$(top_ability_status "$dir")"
      echo "- 解决什么问题：参考 README 补全"
      if [[ -d "$dir/examples" ]] && find "$dir/examples" -type f | grep -q .; then
        echo "- 已验证场景：有 examples，可继续回填真实案例"
      else
        echo "- 已验证场景：待补"
      fi
      echo "- 风险或限制：$(top_ability_notes "$dir")"
      echo
    done
  else
    echo "- 未发现 Top能力 目录"
    echo
  fi
}

emit_script_sections() {
  local root="$1"
  echo "## 扫描到的脚本"
  echo
  if [[ -d "$root/scripts" ]]; then
    find "$root/scripts" -type f \( -name "*.sh" -o -name "*.js" -o -name "*.mjs" \) | sort | while read -r file; do
      rel="$(repo_rel "$root" "$file")"
      base="$(basename "$file")"
      echo "### $base"
      echo
      echo "- 类型：脚本"
      echo "- 主要入口：$rel"
      echo "- 解决什么问题：$(script_notes "$rel")"
      echo "- 什么时候用：按 scripts/README 的入口说明使用"
      echo "- 当前状态：$(script_status "$rel")"
      echo "- 已验证场景：可结合 scripts/README 与实战记录补全"
      echo "- 风险或限制：需要人工确认输出内容是否符合场景"
      echo
    done
  else
    echo "- 未发现 scripts 目录"
    echo
  fi
}

emit_skill_sections() {
  local root="$1"
  echo "## 扫描到的仓内 SKILL"
  echo
  if [[ "$scan_mode" == "formal" ]]; then
    skill_matches="$(
      {
        find "$root/skills" -type f -name 'SKILL.md' 2>/dev/null
        find "$root/Top能力" -type f -name 'SKILL.md' 2>/dev/null
      } | sort || true
    )"
  else
    skill_matches="$(find "$root" -type f -name 'SKILL.md' 2>/dev/null | sort || true)"
  fi

  if [[ -n "$skill_matches" ]]; then
    while read -r skill_file; do
      rel="$(repo_rel "$root" "$skill_file")"
      parent="$(dirname "$rel")"
      if [[ "$scan_mode" == "formal" && "$rel" == Top能力/*/SKILL.md ]]; then
        continue
      fi
      echo "### $parent"
      echo
      echo "- 类型：Skill"
      echo "- 主要入口：$rel"
      echo "- 解决什么问题：$(skill_notes "$rel")"
      echo "- 当前状态：$(skill_status "$rel")"
      echo
    done <<< "$skill_matches"
  else
    echo "- 未发现仓内 SKILL.md"
    echo
  fi
}

emit_adapter_sections() {
  local root="$1"
  local adapter_matches

  echo "## 扫描到的工具适配层"
  echo

  adapter_matches="$(
    {
      [[ -f "$root/AGENTS.md" ]] && echo "$root/AGENTS.md"
      [[ -f "$root/CLAUDE.md" ]] && echo "$root/CLAUDE.md"
      [[ -f "$root/.claude/README.md" ]] && echo "$root/.claude/README.md"
      find "$root/.claude/rules" -type f 2>/dev/null
      find "$root/.claude/skills" -type f 2>/dev/null
      find "$root/.claude/agents" -type f 2>/dev/null
      find "$root/.cursor/rules" -type f 2>/dev/null
      find "$root/.cursor/commands" -type f 2>/dev/null
    } | sort || true
  )"

  if [[ -n "$adapter_matches" ]]; then
    while read -r adapter_file; do
      local rel
      local label
      rel="$(repo_rel "$root" "$adapter_file")"
      label="$(adapter_label "$rel")"
      echo "### $label"
      echo
      echo "- 类型：Adapter"
      echo "- 主要入口：$rel"
      echo "- 解决什么问题：$(adapter_notes "$rel")"
      echo "- 当前状态：$(adapter_status "$rel")"
      echo
    done <<< "$adapter_matches"
  else
    echo "- 未发现工具适配层文件"
    echo
  fi
}

emit_table_header() {
  echo "| Name | Type | Entry | Status | Notes |"
  echo "| --- | --- | --- | --- | --- |"
}

emit_top_ability_table() {
  local root="$1"
  if [[ -d "$root/Top能力" ]]; then
    find "$root/Top能力" -mindepth 1 -maxdepth 1 -type d | sort | while read -r dir; do
      local name
      local entry
      local status
      local notes
      name="$(basename "$dir")"
      entry="${dir#$root/}/README.md"
      status="$(top_ability_status "$dir")"
      notes="$(top_ability_notes "$dir")"
      echo "| $name | Top能力 | \`$entry\` | $status | $notes |"
    done
  fi
}

emit_script_table() {
  local root="$1"
  if [[ -d "$root/scripts" ]]; then
    find "$root/scripts" -type f \( -name "*.sh" -o -name "*.js" -o -name "*.mjs" \) | sort | while read -r file; do
      local rel
      local base
      local status
      local notes
      rel="$(repo_rel "$root" "$file")"
      base="$(basename "$file")"
      status="$(script_status "$rel")"
      notes="$(script_notes "$rel")"
      echo "| $base | 脚本 | \`$rel\` | $status | $notes |"
    done
  fi
}

emit_skill_table() {
  local root="$1"
  local skill_matches

  if [[ "$scan_mode" == "formal" ]]; then
    skill_matches="$(
      {
        find "$root/skills" -type f -name 'SKILL.md' 2>/dev/null
        find "$root/Top能力" -type f -name 'SKILL.md' 2>/dev/null
      } | sort || true
    )"
  else
    skill_matches="$(find "$root" -type f -name 'SKILL.md' 2>/dev/null | sort || true)"
  fi

  if [[ -n "$skill_matches" ]]; then
    while read -r skill_file; do
      local rel
      local parent
      local status
      local notes
      rel="$(repo_rel "$root" "$skill_file")"
      parent="$(dirname "$rel")"
      if [[ "$scan_mode" == "formal" && "$rel" == Top能力/*/SKILL.md ]]; then
        continue
      fi
      status="$(skill_status "$rel")"
      notes="$(skill_notes "$rel")"
      echo "| $parent | Skill | \`$rel\` | $status | $notes |"
    done <<< "$skill_matches"
  fi
}

emit_adapter_table() {
  local root="$1"
  local adapter_matches

  adapter_matches="$(
    {
      [[ -f "$root/AGENTS.md" ]] && echo "$root/AGENTS.md"
      [[ -f "$root/CLAUDE.md" ]] && echo "$root/CLAUDE.md"
      [[ -f "$root/.claude/README.md" ]] && echo "$root/.claude/README.md"
      find "$root/.claude/rules" -type f 2>/dev/null
      find "$root/.claude/skills" -type f 2>/dev/null
      find "$root/.claude/agents" -type f 2>/dev/null
      find "$root/.cursor/rules" -type f 2>/dev/null
      find "$root/.cursor/commands" -type f 2>/dev/null
    } | sort || true
  )"

  if [[ -n "$adapter_matches" ]]; then
    while read -r adapter_file; do
      local rel
      local label
      local status
      local notes
      rel="$(repo_rel "$root" "$adapter_file")"
      label="$(adapter_label "$rel")"
      status="$(adapter_status "$rel")"
      notes="$(adapter_notes "$rel")"
      echo "| $label | Adapter | \`$rel\` | $status | $notes |"
    done <<< "$adapter_matches"
  fi
}

generate_markdown() {
  local root="$1"
  emit_header "$root"

  if [[ "$output_format" == "table" ]]; then
    emit_table_header
    emit_top_ability_table "$root"
    emit_script_table "$root"
    emit_skill_table "$root"
    emit_adapter_table "$root"
    return
  fi

  emit_top_ability_sections "$root"
  emit_script_sections "$root"
  emit_skill_sections "$root"
  emit_adapter_sections "$root"
}

if [[ -n "$output_file" ]]; then
  resolved_output_file="$output_file"
else
  mkdir -p "$default_output_dir"
  timestamp="$(date '+%Y%m%d-%H%M%S')"
  resolved_output_file="$default_output_dir/tool-registry-$output_format-$timestamp.md"
  latest_output_file="$default_output_dir/latest-$output_format.md"
fi

mkdir -p "$(dirname "$resolved_output_file")"
generate_markdown "$target_dir" > "$resolved_output_file"

if [[ -n "$latest_output_file" ]]; then
  cp "$resolved_output_file" "$latest_output_file"
fi

echo "Draft written to: $resolved_output_file"
if [[ -n "$latest_output_file" ]]; then
  echo "Latest draft updated: $latest_output_file"
fi
