# AIVibe OS 长任务专题吸收决策

## 这轮研究要吸收什么

基于 Temporal、LangGraph、OpenAI Agents SDK、Langfuse 的官方资料，这轮专题后 AIVibe OS 先吸收下面 4 个决策。

## 决策 1：长任务机制单独成层

以后长任务不能只视为 worker 里的普通异步函数。

要单独回答：

- 状态保存
- 中断恢复
- 副作用幂等
- 人工介入

## 决策 2：Guardrails 与 Interrupt 要联动

当高风险输入输出命中 guardrail 时，不应只记日志，应可直接：

- 中断
- 等人确认
- 再恢复

## 决策 3：多 Agent handoff 未来要进入运行层

现在 handoff 还是文档模板。

下一阶段应逐步演进到：

- handoff 可追踪
- handoff 可恢复
- handoff 可回放

## 决策 4：发布后的定位依赖 tracing

以后发布事故、长任务失败、多 Agent 协作掉链子，默认优先从 trace / span 证据里找问题，而不是只翻分散日志。

## AIVibe OS 下一步任务

基于这轮吸收，下一步应新增：

1. `054_AIVibe_OS_HITL_中断与恢复规范.md`
2. `055_AIVibe_OS_长任务状态模型.md`
3. `056_AIVibe_OS_Trace_Span_Event_模板.md`

## 一句话原则

**长任务不是排队跑完就算赢，而是中断后还能稳稳接上。**
