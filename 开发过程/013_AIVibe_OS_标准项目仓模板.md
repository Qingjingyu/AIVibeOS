# AIVibe OS 标准项目仓模板

## 目标

这份文档回答一个最实际的问题：

以后新产品启动时，仓库应该默认长什么样，避免每个项目重新搭目录、重新想边界、重新配基础设施。

## 默认结构

推荐默认使用 monorepo：

```text
apps/
  web/
  api/
  worker/
packages/
  ui/
  shared/
  ai/
  config/
docs/
  specs/
  designs/
  qa/
  releases/
```

## 每个目录负责什么

### apps/web

放前端应用。

只负责：

- 页面
- 交互
- 展示状态
- 接口调用

不要把模型调用、数据库逻辑、长任务逻辑塞进这里。

### apps/api

放后端主服务。

只负责：

- 业务接口
- 权限控制
- 数据读写
- 服务编排

### apps/worker

放异步任务和长流程。

适合：

- AI 生成任务
- 文件处理
- 批量任务
- 通知发送

### packages/ui

放设计 token、基础组件和页面模块。

这是 Figma 到代码链路的主落点。

### packages/shared

放跨前后端共享内容：

- 类型
- 常量
- 工具函数
- 错误码

### packages/ai

放统一 AI Gateway 和相关能力：

- provider 接入
- prompts
- tasks
- evals
- logs

### packages/config

放公共配置：

- lint
- tsconfig
- formatter
- env 模板

## 默认文档目录

每个项目默认应保留：

- `docs/specs/`
- `docs/designs/`
- `docs/qa/`
- `docs/releases/`

目的是让需求、设计、测试、发布证据不散落。

## 默认工程要求

项目模板至少应包含：

- 基础 lint 命令
- 基础 test 命令
- 基础 build 命令
- 环境变量示例文件
- README 启动说明
- 最小健康检查入口

## 默认边界规则

- web 不直接调模型 provider
- api 不直接写页面逻辑
- worker 不负责对外页面接口
- 页面层不定义设计系统
- 业务代码不自己造共享类型副本

## 启动一个新项目时的最低交付

标准项目模板不是只有目录，还要能支撑最小启动。

至少要做到：

1. 能启动前端应用
2. 能启动后端服务
3. 能跑一个最小异步任务
4. 能消费 `packages/ui`
5. 能通过 `packages/ai` 暴露一个统一 AI 能力入口

## 一句话铁规矩

**新项目默认站在统一骨架上启动，不允许每次从零发明工程结构。**
