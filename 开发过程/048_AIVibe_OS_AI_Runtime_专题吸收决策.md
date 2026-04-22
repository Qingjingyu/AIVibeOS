# AIVibe OS AI Runtime 专题吸收决策

## 这轮研究要吸收什么

基于 OpenAI Agents SDK、OpenAI Guardrails、Langfuse 和 LangGraph 官方资料，这轮专题后 AIVibe OS 先吸收下面 4 个决策。

## 决策 1：Tracing 从“日志字段”升级到“运行轨迹”

以后 AIVibe OS 不再只满足于记录日志字段。

默认方向应升级为：

- request 级 trace
- task 级 span
- tool / guardrail / handoff 级事件

这样才能真正定位：

- 卡在哪一步
- 哪一步成本最高
- 哪一步失败最多

## 决策 2：Guardrails 成为 Task 标配挂点

以后每个准备进入生产的 AI Task，都应该明确：

- 输入 guardrail
- 输出 guardrail
- 触发 tripwire 后怎么处理

Guardrail 不再视为“可选安全件”，而视为 Runtime 的一部分。

## 决策 3：长任务默认按“可恢复”设计

以后涉及：

- 多步骤 AI 任务
- 人工审批
- 异步长流程
- 多 Agent 协作

默认都要先回答：

- 中断后怎么恢复
- 从哪一步恢复
- 如何避免重跑已完成步骤

这就是 durable execution 的最低思维。

## 决策 4：人机交互应支持暂停与恢复

Agent 分工文档已经写了，但还停在静态角色层。

下一步应把高风险动作、人工审批、多 Agent 交接，逐步收敛成：

- 哪些动作必须暂停
- 暂停时要保存什么状态
- 人类决策后如何继续

## AIVibe OS 下一步任务

基于这轮吸收，下一步应新增：

1. `049_AIVibe_OS_Guardrails_规范.md`
2. `050_AIVibe_OS_Tracing_模型.md`
3. `051_AIVibe_OS_长任务与恢复机制.md`

## 当前判断

这轮研究说明，AIVibe OS 的 AI Runtime 已经不该再只围绕 prompt、task、evals 打转，而要正式进入“运行控制”阶段。

## 一句话原则

**AI Runtime 的下一个阶段，不是再多接几个模型，而是让运行过程可看见、可拦截、可恢复。**
