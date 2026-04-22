#!/usr/bin/env bash
set -euo pipefail

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
repo_root="$(cd "$script_dir/../.." && pwd)"
output_dir="$repo_root/治理输出/closeout"
timestamp="$(date '+%Y%m%d-%H%M%S')"
output_file="$output_dir/closeout-$timestamp.md"
latest_file="$output_dir/latest.md"

phase_latest="$repo_root/治理输出/phase-check/latest.txt"
tool_latest="$repo_root/治理输出/tool-registry/latest-table.md"
bootstrap_latest="$repo_root/治理输出/bootstrap-board/latest.md"

mkdir -p "$output_dir"

pushd "$repo_root" >/dev/null
bash "./scripts/governance/phase-check.sh" "." project >/dev/null
bash "./scripts/governance/tool-registry-draft.sh" "." formal table >/dev/null
bash "./scripts/governance/update-bootstrap-board.sh" >/dev/null
popd >/dev/null

phase_summary="$(
  awk '
    /^Phase Summary$/ { flag=1; next }
    /^Missing Next Actions$/ { flag=0 }
    flag { print }
  ' "$phase_latest" | sed '/^$/d'
)"

phase_missing_actions="$(
  awk '
    /^Missing Next Actions$/ { flag=1; next }
    flag { print }
  ' "$phase_latest" | sed '/^$/d'
)"

bootstrap_stage="$(
  awk '
    /^## 阶段状态$/ { flag=1; next }
    /^## 当前资产计数$/ { flag=0 }
    flag { print }
  ' "$bootstrap_latest" | sed '/^$/d'
)"

bootstrap_assets="$(
  awk '
    /^## 当前资产计数$/ { flag=1; next }
    /^## 当前重点$/ { flag=0 }
    flag { print }
  ' "$bootstrap_latest" | sed '/^$/d'
)"

if [[ -z "$phase_missing_actions" ]]; then
  phase_missing_actions="- 当前没有新增缺项。"
fi

cat > "$output_file" <<EOF
# AIVibe Closeout Snapshot

生成时间：$(date '+%Y-%m-%d %H:%M:%S')

## 本轮固定收尾命令

\`\`\`bash
bash ./scripts/governance/run-aivibe-closeout.sh
\`\`\`

## 本轮结果入口

- Phase Check：\`治理输出/phase-check/latest.txt\`
- Tool Registry：\`治理输出/tool-registry/latest-table.md\`
- Bootstrap Board：\`治理输出/bootstrap-board/latest.md\`
- Closeout Snapshot：\`治理输出/closeout/latest.md\`

## 阶段检查摘要

\`\`\`text
${phase_summary}
\`\`\`

## 自举看板摘要

\`\`\`text
${bootstrap_stage}
${bootstrap_assets}
\`\`\`

## 当前缺项动作

\`\`\`text
${phase_missing_actions}
\`\`\`

## 使用说明

1. 这份文件不是母文档，它是本轮固定收尾快照。
2. 如果这里暴露出新的缺项，再回写到 \`开发过程/\` 对应入口或规范文档。
3. 默认永远看 \`latest.md\`，历史快照只在需要追溯时再看。
EOF

cp "$output_file" "$latest_file"

echo "Closeout snapshot written to: $output_file"
echo "Latest closeout updated: $latest_file"
