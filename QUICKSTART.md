# Quick Start

## 适合谁

如果你想把 AI 开发从“写 Demo”推进到“可交付、可验证、可回滚”，这套系统就是给你用的。

## 5 分钟上手

### 1. 先看首页

- [README.md](./README.md)

### 2. 确认你用什么工具

- Claude Code：看 [CLAUDE.md](./CLAUDE.md)
- Cursor：看 [AGENTS.md](./AGENTS.md) 和 [`.cursor/`](./.cursor)
- 其他兼容工具：先从 [AGENTS.md](./AGENTS.md) 开始

### 3. 按阶段进入，不要直接开写

主路径固定是：

`/spec -> /plan -> /build -> /test -> /review -> /ship`

对应入口在：

- [commands/README.md](./commands/README.md)

### 4. 让系统拉起对应 skill

技能入口在：

- [skills/README.md](./skills/README.md)

如果你在 Claude Code 里工作，还可以直接使用：

- [`.claude/skills/`](./.claude/skills)
- [`.claude/agents/`](./.claude/agents)

### 5. 每轮结束跑一次固定收尾

```bash
bash ./scripts/governance/run-aivibe-closeout.sh
```

结果看这里：

- [治理输出/closeout/latest.md](./治理输出/closeout/latest.md)

## 常见起点

### 我在开一个新项目

先看：

- [开发过程/083_AIVibe_OS_新项目最小启动路径.md](./开发过程/083_AIVibe_OS_新项目最小启动路径.md)
- [开发过程/094_AIVibe_OS_项目启动模板入口.md](./开发过程/094_AIVibe_OS_项目启动模板入口.md)

### 我要直接接工具

先看：

- [AGENTS.md](./AGENTS.md)
- [CLAUDE.md](./CLAUDE.md)
- [.claude/README.md](./.claude/README.md)

### 我要看这套系统到底有哪些能力

先看：

- [开发过程/020_AIVibe_OS_总索引.md](./开发过程/020_AIVibe_OS_总索引.md)
- [治理输出/tool-registry/latest-table.md](./治理输出/tool-registry/latest-table.md)

## 当前定位

当前版本是：

- `v1.0.0-beta.1`

这意味着：

- 可以正式试用
- 可以对外分发
- 但还应该继续用真实项目回灌
