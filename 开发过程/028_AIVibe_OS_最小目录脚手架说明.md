# AIVibe OS 最小目录脚手架说明

## 目标

定义一个“最小可用”的项目目录，不求完整，但求启动后边界清楚。

## 最小脚手架

```text
apps/
  web/
  api/
  worker/
packages/
  ui/
  shared/
  ai/
docs/
  specs/
  qa/
README.md
.env.example
```

## 最低要求

- `web` 能渲染一个页面
- `api` 能返回一个健康检查
- `worker` 能执行一个异步任务
- `ui` 能暴露一个基础组件
- `ai` 能暴露一个统一 Task 入口

## 一句话铁规矩

**脚手架不是摆设，最小目录也必须能跑最小闭环。**
