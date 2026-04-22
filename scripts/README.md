# AIVibe OS Scripts

这里放 AIVibe OS 已经开始落地的脚本。

当前原则很简单：

- 先做高频动作
- 先做可验收动作
- 先做小而硬的脚本
- 不先做大而全黑盒

## 当前脚本

### `scripts/qa/capture-page.sh`

用途：

- 对本地或线上页面做固定尺寸截图

适合：

- 页面验收
- 截图留证
- Figma 对稿前的页面抓图

示例：

```bash
bash ./scripts/qa/capture-page.sh http://127.0.0.1:3000 /tmp/page.png 402 874
```

### `scripts/governance/phase-check.sh`

用途：

- 快速检查一个项目文档目录里，Proposal / Spec / Design / Tasks / QA / Release / README 这些关键证据有没有

适合：

- 新项目自检
- 阶段检查
- 交付前快速补缺

示例：

```bash
bash ./scripts/governance/phase-check.sh /path/to/project/docs
bash ./scripts/governance/phase-check.sh /path/to/project project
bash ./scripts/governance/phase-check.sh /path/to/project/docs /tmp/phase-check-report.txt
bash ./scripts/governance/phase-check.sh /path/to/project /tmp/phase-check-report.txt project
```

如果不传路径，默认检查当前目录。

补充：

- 第二个参数可传输出文件
- 这样可以把阶段检查结果保存下来，作为交付证据
- 第三个参数可传扫描模式：`auto` / `docs` / `project`
- 如果传项目根目录，推荐显式用 `project`
- 如果不传输出文件，默认写入 `治理输出/phase-check/`

备注：

- 某些环境直接 `./script.sh` 可能会遇到执行限制
- 遇到这种情况，直接用 `bash ./script.sh` 或 `zsh ./script.sh` 即可

### `scripts/governance/tool-registry-draft.sh`

用途：

- 扫描仓库里的 `Top能力`、脚本、`SKILL.md`，生成一份工具台账草稿

适合：

- 补工具总表
- 新项目盘点现有能力
- 做治理层资产整理

示例：

```bash
bash ./scripts/governance/tool-registry-draft.sh .
bash ./scripts/governance/tool-registry-draft.sh . formal table
bash ./scripts/governance/tool-registry-draft.sh . /tmp/tool-registry-draft.md
bash ./scripts/governance/tool-registry-draft.sh . /tmp/tool-registry-draft.md all
bash ./scripts/governance/tool-registry-draft.sh . /tmp/tool-registry-table.md formal table
```

补充：

- 默认使用 `formal` 模式，只扫描正式资产
- 传第三个参数 `all` 时，才扫描仓内所有 `SKILL.md`
- 第四个参数可传 `table`，直接输出 Markdown 表格版本
- `formal` 模式下会跳过已并入 Top能力 的重复 Skill 条目
- 现在会自动补一部分状态和说明，不再只吐空表
- 如果不传输出文件，默认写入 `治理输出/tool-registry/`

### `scripts/governance/update-bootstrap-board.sh`

用途：

- 生成一份最新的 AIVibe 自举看板快照

适合：

- 想快速看当前系统建设状态
- 想留下一份固定治理快照

示例：

```bash
bash ./scripts/governance/update-bootstrap-board.sh
```

补充：

- 默认写入 `治理输出/bootstrap-board/`
- 每次运行会同时更新：
  - 时间戳快照文件
  - `治理输出/bootstrap-board/latest.md`
- 适合挂到每轮自优化收尾动作里，固定留证

### `scripts/governance/run-aivibe-closeout.sh`

用途：

- 跑完 AIVibe OS 一轮固定收尾动作

适合：

- 每轮自优化结束后
- 调整治理脚本后
- 对外汇报当前系统状态前

示例：

```bash
bash ./scripts/governance/run-aivibe-closeout.sh
```

补充：

- 会顺序刷新：
  - `治理输出/phase-check/latest.txt`
  - `治理输出/tool-registry/latest-table.md`
  - `治理输出/bootstrap-board/latest.md`
  - `治理输出/closeout/latest.md`
- 如果只想先看一份总结果，直接看 `治理输出/closeout/latest.md`

## 一句话铁规矩

脚本是为了把高频动作做稳，不是为了堆工具数量。
