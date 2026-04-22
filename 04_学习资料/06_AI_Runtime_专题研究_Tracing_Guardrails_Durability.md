# AI Runtime 专题研究：Tracing / Guardrails / Durability

## 研究目标

这一轮研究要回答 3 个问题：

1. 一个生产级 AI Runtime，除了“能调模型”，还必须具备什么
2. 外部成熟方案在 tracing、guardrails、durable execution 上怎么做
3. 哪些能力应该直接吸收到 AIVibe OS

## 结论先说

这一轮看下来，生产级 AI Runtime 至少要补齐 4 层：

- **Tracing**：知道每次调用做了什么、花了多少、卡在哪
- **Guardrails**：知道哪些输入输出该拦、该改、该拒绝
- **Durability**：知道长流程中断后怎么继续，不要从头再来
- **Human-in-the-loop**：知道什么时候必须暂停，等人拍板

这四层不补，AI Runtime 仍然只是“统一调模型的代码壳”。

## 关键信息 1：Tracing 不只是日志

OpenAI Agents SDK 明确把 tracing 当作一等能力，默认会记录 agent run、LLM generation、tool calls、guardrails 和 handoffs。  
这说明 tracing 不该是后补的日志系统，而应该从 Runtime 设计时就内置进去。  
来源：

- OpenAI Agents SDK tracing：<https://openai.github.io/openai-agents-python/tracing/>
- OpenAI Agents SDK 概览：<https://openai.github.io/openai-agents-python/>

与此同时，Langfuse 把 tracing、prompt management 和 evaluation 直接做成一个连续工作流，说明生产级系统不能只记日志，还要让日志直接进入 prompt 迭代和评测。  
来源：

- Langfuse Overview：<https://langfuse.com/docs>

## 关键信息 2：Guardrails 应该是 Runtime 一部分

OpenAI Agents SDK 和 OpenAI Guardrails 都强调：

- 输入可以被校验
- 输出可以被校验
- 不符合要求时应触发 tripwire 或直接中断

这意味着 AIVibe OS 里的 guardrail 不是“额外安全组件”，而是 Task 进入生产前的最小门槛之一。  
来源：

- OpenAI Agents SDK guardrails：<https://openai.github.io/openai-agents-python/guardrails/>
- OpenAI Guardrails Python：<https://openai.github.io/openai-guardrails-python/>

## 关键信息 3：Durability 的关键不是“长”，而是“可恢复”

LangGraph 的官方文档把 durable execution 讲得很直白：

- 持久化状态
- 线程 ID 作为恢复指针
- 中断后可继续
- 故障后不必重跑所有步骤

这说明对 AIVibe OS 来说，长任务系统的核心不是“队列很多”，而是“每一步状态能不能安全恢复”。  
来源：

- LangGraph durable execution：<https://docs.langchain.com/oss/javascript/langgraph/durable-execution>
- LangGraph persistence：<https://docs.langchain.com/oss/javascript/langgraph/persistence>

## 关键信息 4：Human-in-the-loop 要能暂停，不是只做审批页面

LangGraph 的中断和 human-in-the-loop 机制很值得学：

- 执行到某一步可以暂停
- 暂停后状态被保存
- 用户决策后继续从原点恢复

这个思路对 AIVibe OS 很重要，因为多 Agent 协作和高风险工具调用，本质上都需要“停下来等人决定”。  
来源：

- LangGraph interrupts：<https://docs.langchain.com/oss/javascript/langgraph/human-in-the-loop>
- LangChain human-in-the-loop：<https://docs.langchain.com/oss/javascript/langchain/human-in-the-loop>

## 对 AIVibe OS 的直接启发

第一，AI Runtime 应从“统一调用层”升级为“统一运行层”。  
第二，Task 不仅需要 schema 和 eval，还需要 guardrail 挂点。  
第三，Tracing 应该从日志模板升级为 trace / span 视角。  
第四，长任务与多 Agent 协作需要 durable execution 思维，而不是只靠普通队列。  
第五，人与 Agent 的交接不应只存在于文档，也应成为可暂停、可恢复的运行规则。

## 这轮研究后的建议动作

1. 补 `AIVibe OS Guardrails 规范`
2. 补 `AIVibe OS Tracing / Span 模型`
3. 补 `AIVibe OS 长任务与恢复机制`
4. 把 Agent 交接进一步升级为“可中断、可恢复”的实战规则

## 一句话总结

**生产级 AI Runtime 不是“把模型统一接进来”，而是把 tracing、guardrails、durability 和 human-in-the-loop 一起接进来。**
