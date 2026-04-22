#!/usr/bin/env bash
set -euo pipefail

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
repo_root="$(cd "$script_dir/../.." && pwd)"
output_dir="$repo_root/治理输出/bootstrap-board"
timestamp="$(date '+%Y%m%d-%H%M%S')"
output_file="$output_dir/bootstrap-board-$timestamp.md"
latest_file="$output_dir/latest.md"

count_existing() {
  local total=0
  for path in "$@"; do
    if [[ -e "$repo_root/$path" ]]; then
      total=$((total + 1))
    fi
  done
  echo "$total"
}

p1_paths=(
  "开发过程/082_AIVibe_OS_自我优化_Spec_v1.md"
  "开发过程/083_AIVibe_OS_新项目最小启动路径.md"
  "开发过程/084_AIVibe_OS_Top能力_统一规范.md"
  "开发过程/085_AIVibe_OS_Phase_证据化规范.md"
  "开发过程/086_AIVibe_OS_实战回灌_SOP.md"
  "开发过程/087_AIVibe_OS_工具与依赖总表.md"
)

p2_paths=(
  "开发过程/088_AIVibe_OS_模板减负与归并方案_v1.md"
  "开发过程/089_AIVibe_OS_核心链路脚本化方案_v1.md"
  "开发过程/090_AIVibe_OS_自举看板_v1.md"
  "开发过程/091_AIVibe_OS_QA_与发布_时间线入口.md"
  "开发过程/092_AIVibe_OS_AI_Runtime_模板入口.md"
  "开发过程/093_AIVibe_OS_Figma_系统模板与Top能力_边界入口.md"
  "开发过程/094_AIVibe_OS_项目启动模板入口.md"
  "开发过程/095_AIVibe_OS_观测与日志入口.md"
  "开发过程/096_AIVibe_OS_自举与治理入口.md"
  "开发过程/097_AIVibe_OS_固定收尾动作_SOP.md"
)

script_paths=(
  "scripts/qa/capture-page.sh"
  "scripts/governance/phase-check.sh"
  "scripts/governance/tool-registry-draft.sh"
  "scripts/governance/update-bootstrap-board.sh"
  "scripts/governance/run-aivibe-closeout.sh"
)

p1_count="$(count_existing "${p1_paths[@]}")"
p2_count="$(count_existing "${p2_paths[@]}")"
script_count="$(count_existing "${script_paths[@]}")"

p1_status="进行中"
[[ "$p1_count" -eq "${#p1_paths[@]}" ]] && p1_status="已完成"

p2_status="进行中"
[[ "$p2_count" -eq "${#p2_paths[@]}" ]] && p2_status="已完成"

governance_output_count="$(find "$repo_root/治理输出" -type f 2>/dev/null | wc -l | tr -d ' ')"

mkdir -p "$output_dir"

cat > "$output_file" <<EOF
# AIVibe OS 自举看板快照

生成时间：$(date '+%Y-%m-%d %H:%M:%S')

## 阶段状态

- P1：${p1_status}（${p1_count} / ${#p1_paths[@]}）
- P2：${p2_status}（${p2_count} / ${#p2_paths[@]}）
- P3：未开始

## 当前资产计数

- 已落地治理脚本：${script_count}
- 治理输出文件数：${governance_output_count}
- Top能力 数量：$(find "$repo_root/Top能力" -mindepth 1 -maxdepth 1 -type d 2>/dev/null | wc -l | tr -d ' ')

## 当前重点

1. 保持固定收尾动作执行并持续回写稳定结论
2. 选择下一个最值得脚本化的治理动作
3. 开始评估 P3 的能力产品化入口

## 已存在的治理脚本

- \`scripts/qa/capture-page.sh\`
- \`scripts/governance/phase-check.sh\`
- \`scripts/governance/tool-registry-draft.sh\`
- \`scripts/governance/update-bootstrap-board.sh\`
- \`scripts/governance/run-aivibe-closeout.sh\`

## 已存在的固定治理输出目录

- \`治理输出/phase-check/\`
- \`治理输出/tool-registry/\`
- \`治理输出/bootstrap-board/\`
- \`治理输出/closeout/\`

## 一句话

**AIVibe 已经进入“文档 + 脚本 + 固定治理输出”阶段。**
EOF

cp "$output_file" "$latest_file"

echo "Bootstrap board snapshot written to: $output_file"
echo "Latest snapshot updated: $latest_file"
