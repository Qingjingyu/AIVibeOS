# AIVibe OS

> Version: `v1.0.0-beta.1`

AIVibe OS 是一套面向真实产品交付的人机协同开发操作系统。

它不是一个单独的万能 Agent，也不是一堆散的提示词。它是一套把 AI 开发从“更快写 Demo”推进到“可验证、可回滚、可复用、可出货”的系统。

## 它适合什么

如果你正在做这些事，它就是给你用的：

- 想把 AI 开发从零散试验变成稳定流程
- 想统一需求、实现、测试、评审、发布这条链路
- 想让 Claude、Cursor、Codex 这些工具都接到同一套规则上
- 想给团队一套可以直接复用的开发底座

## 当前发布状态

- 版本号：[`VERSION`](./VERSION)
- 许可证：[`LICENSE`](./LICENSE)
- 发布说明：[`CHANGELOG.md`](./CHANGELOG.md)
- 快速开始：[`QUICKSTART.md`](./QUICKSTART.md)
- 仓库元信息：[`REPO_METADATA.md`](./REPO_METADATA.md)
- Release 正文草稿：[`RELEASE_DRAFT_v1.0.0-beta.1.md`](./RELEASE_DRAFT_v1.0.0-beta.1.md)
- 对外发布文案：[`LAUNCH_COPY.md`](./LAUNCH_COPY.md)

当前版本是 `v1.0.0-beta.1`。

这意味着：

- 已经可以正式试用
- 已经可以对外分发
- 但还应该继续用真实项目做强验证

## 核心组成

- `commands/`
  固定开发阶段入口：`/spec -> /plan -> /build -> /test -> /review -> /ship`
- `skills/`
  正式 root skills，包括开发技能、产品级技能、元能力技能
- `.claude/`
  Claude Code 项目级适配、skills 和 subagents
- `.cursor/`
  Cursor 规则和命令适配层
- `Top能力/`
  更强的独立能力包，例如 `Figmatocode`
- `开发过程/`
  系统级母文档、路线图、规则、模板和治理说明

## 快速入口

如果你第一次上手，按这个顺序：

1. [QUICKSTART.md](./QUICKSTART.md)
2. [AGENTS.md](./AGENTS.md)
3. [commands/README.md](./commands/README.md)
4. [skills/README.md](./skills/README.md)

如果你要接 Claude Code：

1. [CLAUDE.md](./CLAUDE.md)
2. [.claude/README.md](./.claude/README.md)

如果你要看系统全景：

1. [开发过程/020_AIVibe_OS_总索引.md](./开发过程/020_AIVibe_OS_总索引.md)
2. [开发过程/000_Roadmap.md](./开发过程/000_Roadmap.md)

## 现在已经有什么

当前仓库已经包含：

- 25 个 root skills
- 7 个标准 commands
- Claude / Cursor 工具适配层
- Claude 项目级 skills 与专家会诊 subagents
- Figma 高保真还原能力包
- QA / 发布 / 回滚模板
- 治理脚本和固定 closeout 输出

## 使用原则

- 没有 Spec，不开发
- 没有验证证据，不宣称完成
- 没有回滚路径，不宣称可发
- 没有阶段边界，不让 AI 自由漂移

## 深入查看

- 系统总索引：[开发过程/020_AIVibe_OS_总索引.md](./开发过程/020_AIVibe_OS_总索引.md)
- 最新治理结果：[治理输出/closeout/latest.md](./治理输出/closeout/latest.md)
- 工具台账：[治理输出/tool-registry/latest-table.md](./治理输出/tool-registry/latest-table.md)

## 一句话

**AIVibe OS 的目标不是让 AI 看起来更聪明，而是让团队更稳定地做出真正能交付的产品。**
