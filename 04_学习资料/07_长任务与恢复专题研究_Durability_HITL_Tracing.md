# 长任务与恢复专题研究：Durability / HITL / Tracing

## 研究目标

回答三个问题：

1. 多步骤 AI 流程为什么不能只靠普通队列和日志
2. 可恢复执行、人工中断、运行轨迹分别解决什么问题
3. AIVibe OS 最应该吸收哪些能力

## 结论先说

生产级长任务系统，至少要同时具备：

- durable execution
- human-in-the-loop interrupt / resume
- trace / span 级运行轨迹

缺任何一个，系统都容易退回到：

- 出错重跑整条链
- 人工审批只能靠群里喊
- 出问题只能翻日志猜

## 关键信息 1：Durability 的核心是“恢复”，不是“异步”

Temporal 和 LangGraph 都反复强调，durability 的价值不在“任务跑很久”，而在：

- 状态持久化
- 中断后继续
- 失败后不用全链重跑

来源：

- Temporal docs：<https://docs.temporal.io/workflows>
- LangGraph durable execution：<https://docs.langchain.com/oss/javascript/langgraph/durable-execution>
- LangGraph persistence：<https://docs.langchain.com/oss/javascript/langgraph/persistence>

## 关键信息 2：Human-in-the-loop 要支持中断和恢复

LangGraph 官方把 interrupt 当作一等机制，说明人类介入不该是“跳出系统”，而应是系统的一部分。

来源：

- LangGraph human-in-the-loop：<https://docs.langchain.com/oss/javascript/langgraph/human-in-the-loop>

## 关键信息 3：Tracing 要从请求级升级到流程级

OpenAI Agents SDK 的 tracing 和 Langfuse 的 trace/session 视角，都说明长流程不能只看单次 LLM 调用。

来源：

- OpenAI Agents SDK tracing：<https://openai.github.io/openai-agents-python/tracing/>
- Langfuse docs：<https://langfuse.com/docs>

## 对 AIVibe OS 的直接启发

第一，长任务机制应单列成系统能力，而不是藏在 worker 里。  
第二，Agent 交接未来应逐步进入“可暂停、可恢复”的运行层。  
第三，trace / span / event 应成为发布后复盘的重要证据来源。

## 一句话总结

**长任务系统真正要解决的，不是怎么把任务丢进后台，而是中断、审批、失败之后怎么安全继续。**
