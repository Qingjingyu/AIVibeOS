# Claude Project Layer

这里放 AIVibe OS 在 Claude Code 里的项目级适配层。

## 目录

- `rules/`: Claude 持久规则
- `skills/`: Claude 项目级技能
- `agents/`: Claude 项目级 subagents

## 关系

- `AGENTS.md` 是跨工具 root rules
- `CLAUDE.md` 是 Claude 入口适配
- `.claude/skills/` 是 Claude 可直接触发的项目技能
- `.claude/agents/` 是 Claude 可直接调用的项目 subagents

## 当前新增的元能力

- `brainstorm`
- `office-hours`
- `debug-systematically`
- `verify-before-completion`
- `review-gate`

## 一句话

**这里不是新的系统，只是 AIVibe OS 在 Claude Code 里的落地层。**
