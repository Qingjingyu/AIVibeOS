# AIVibe OS Monorepo 初始化清单

## 目标

让新项目第一次起仓时有一份固定检查单，而不是凭记忆搭骨架。

## 初始化清单

1. 创建 `apps/web`、`apps/api`、`apps/worker`
2. 创建 `packages/ui`、`packages/shared`、`packages/ai`、`packages/config`
3. 创建 `docs/specs`、`docs/designs`、`docs/qa`、`docs/releases`
4. 补 `.env.example`
5. 补 `README.md`
6. 补基础 `lint`、`test`、`build` 命令
7. 补最小健康检查
8. 确认 AI 能力统一从 `packages/ai` 出口暴露

## 验收

- 前端可启动
- 后端可启动
- worker 可执行最小任务
- 共享包可被引用
- 文档目录齐全

## 一句话铁规矩

**先按清单起仓，再写业务，不允许先写一堆代码后补骨架。**
