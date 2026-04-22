# 治理输出

这里放 AIVibe OS 自己的治理脚本默认产物。

它的作用很简单：

- 不再把结果只丢到 `/tmp`
- 让系统输出留在仓库可见范围内
- 让后续复盘、回填、交接更方便

## 当前默认输出

### `治理输出/phase-check/`

来源脚本：

- `scripts/governance/phase-check.sh`

默认会写：

- 时间戳版本
- `latest.txt`

### `治理输出/tool-registry/`

来源脚本：

- `scripts/governance/tool-registry-draft.sh`

默认会写：

- 时间戳版本
- `latest-sections.md`
- `latest-table.md`

### `治理输出/bootstrap-board/`

来源脚本：

- `scripts/governance/update-bootstrap-board.sh`

默认会写：

- 时间戳版本
- `latest.md`

### `治理输出/closeout/`

来源脚本：

- `scripts/governance/run-aivibe-closeout.sh`

默认会写：

- 时间戳版本
- `latest.md`

## 使用原则

这些文件不是最终母文档。

它们是：

- 草稿
- 报告
- 证据

真正稳定的结论，仍然要回写到 `开发过程/` 或 `Top能力/`。

## 一句话铁规矩

治理脚本的默认产物要留在系统里，而不是只在终端里出现过一次。
