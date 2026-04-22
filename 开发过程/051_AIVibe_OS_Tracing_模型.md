# AIVibe OS Tracing 模型

## 目标

把 AIVibe OS 的 tracing 从“有日志字段”升级成“有运行轨迹”。

## 最小模型

AIVibe OS 默认采用三层：

- Trace：一次完整请求或任务
- Span：一次子步骤
- Event：关键事件

## 最少要追踪什么

Trace 层：

- request_id
- session_id
- task_name
- start / end

Span 层：

- generation span
- tool span
- handoff span
- guardrail span

Event 层：

- retry
- degrade
- interrupt
- resume
- failure

## 使用目的

- 排障
- 成本分析
- 性能分析
- 回放定位
- 发布后复盘

## 一句话铁规矩

**Tracing 要能解释一条链路发生了什么，而不只是留下几条孤立日志。**
