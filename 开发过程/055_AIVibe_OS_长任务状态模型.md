# AIVibe OS 长任务状态模型

## 目标

给长任务、多步骤 AI 流程和多 Agent 协作一个统一状态语言。

## 推荐状态

- `pending`
- `running`
- `waiting_human`
- `retrying`
- `degraded`
- `failed`
- `completed`

## 状态含义

### pending

任务已创建，但还没真正开始。

### running

任务正在执行当前步骤。

### waiting_human

任务被中断，等待人工决策后继续。

### retrying

任务某一步失败，正在按策略重试。

### degraded

任务走了降级路径，仍在继续，但结果质量或能力受限。

### failed

任务终止，当前无法继续。

### completed

任务全部完成，并达到当前定义的完成标准。

## 状态流转原则

- `pending -> running`
- `running -> waiting_human`
- `running -> retrying`
- `retrying -> running`
- `running -> degraded`
- `running / degraded -> completed`
- 任一状态在不可恢复时可进入 `failed`

## 一句话铁规矩

**没有统一状态语言，就没有统一恢复、监控和交接。**
