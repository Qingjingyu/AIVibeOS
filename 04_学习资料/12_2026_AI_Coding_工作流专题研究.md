# 2026 AI Coding 工作流专题研究

## 这份研究要回答什么

按 2026-04-22 当前状态，AI coding 这条线已经明显从“单次对话生成代码”升级成了“多代理、异步、可审计的开发系统”。

这份研究只回答 3 个问题：

1. 现在最值得吸收的稳定做法是什么
2. 哪些只是平台包装，暂时不值得写进 AIVibe OS
3. AIVibe OS 接下来应该补哪些硬规则

---

## 一、这一轮最明显的行业变化

### 1. 从单代理，变成多代理

官方文档已经不再只强调“让 AI 帮你写代码”。

更常见的说法变成：

- 一个主代理负责当前上下文
- 子代理负责并行处理独立任务
- 背景代理负责长任务
- 云端代理负责异步改代码和提 PR

这说明 AI coding 的主问题，已经不是“模型会不会写”，而是：

**任务怎么拆，责任怎么分，结果怎么回收。**

### 2. 从一大段 prompt，变成指令栈

现在最成熟的做法，不再是把所有规则堆进一个长 prompt。

更稳定的结构是：

- 仓库总规则
- 工具专属规则
- 路径专属规则
- 任务专属计划
- 运行时硬拦截

这背后的本质很简单：

**规则必须分层，不然越写越冲突。**

### 3. 从同步聊天，变成本地 + 后台 + 云端三种执行模式

这轮官方工具几乎都在补异步执行：

- 本地结对
- 后台运行
- 云端分支 / PR 代理

这说明未来不是所有任务都该“在当前聊天里做完”。

更合理的方式是：

- 高风险任务留在本地
- 长任务放后台
- 可隔离任务交给云端 PR 代理

### 4. 从软提醒，变成 hooks 和自动检查

以前很多规则只能靠“记得做”。

现在成熟做法越来越像：

- 提前阻止危险动作
- 改完立刻跑格式化 / lint / 测试
- 交付前自动补证据

一句话：

**提示词负责引导，hooks 负责兜底。**

---

## 二、各家官方现在在强调什么

### 1. Claude Code

Anthropic 官方现在最稳定的信号有 4 个：

- 先探索上下文，再计划，再改动
- 用 `CLAUDE.md` 和 imported memory 管规则
- 用 subagents 做并行与角色拆分
- 用 hooks / MCP 把工具和强制流程接进来

这说明 Claude Code 的主线已经不是“聊天写代码”，而是：

**把仓库规则、子代理和工具编排成一个长期工作环境。**

参考：

- https://code.claude.com/docs/en/best-practices
- https://code.claude.com/docs/en/memory
- https://code.claude.com/docs/en/sub-agents
- https://docs.anthropic.com/en/docs/claude-code/hooks
- https://docs.anthropic.com/en/docs/claude-code/mcp

### 2. OpenAI Codex

OpenAI 这轮释放的信号也很明确：

- `AGENTS.md` 作为仓库级说明入口
- Codex CLI 作为本地结对入口
- Codex app / cloud 作为异步任务和委托入口
- skills 被当成正式工作流资产，而不是临时 prompt

它强调的是：

**把团队常见任务沉成稳定技能，再让代理异步执行。**

参考：

- https://developers.openai.com/codex/cli
- https://platform.openai.com/docs/guides/code-generation
- https://openai.com/index/introducing-codex/
- https://openai.com/index/codex-now-generally-available/
- https://openai.com/index/introducing-the-codex-app/
- https://cdn.openai.com/pdf/6a2631dc-783e-479b-b1a4-af0cfbd38630/how-openai-uses-codex.pdf

### 3. GitHub Copilot

GitHub 这轮重点不在聊天界面，而在：

- cloud agent
- custom agents
- PR 工作流
- 安全扫描、审计、分支隔离

换句话说，GitHub 在推动的是：

**把 AI 变成一个能提 PR、能被审计、能被权限系统约束的远程协作者。**

参考：

- https://docs.github.com/en/copilot/concepts/coding-agent/about-copilot-coding-agent
- https://docs.github.com/en/copilot/how-tos/copilot-sdk/use-copilot-sdk/custom-agents
- https://docs.github.com/en/copilot/responsible-use/copilot-coding-agent

### 4. Cursor

Cursor 现在最值得吸收的不是某个界面功能，而是两点：

- rules 分层
- background agents

这背后的判断是：

- 规则必须能按项目和目录切层
- 长任务不该永远占着主对话

参考：

- https://docs.cursor.com/context/rules
- https://docs.cursor.com/background-agents

### 5. Aider

Aider 虽然界面不花，但它有几条一直很硬的工程习惯：

- architect / code 模式分工
- 明确的 conventions
- 改完就跑 lint / test

它提醒我们的点是：

**别只追代理数量，工程闭环比花哨交互更重要。**

参考：

- https://aider.chat/docs/usage/modes.html
- https://aider.chat/docs/usage/conventions.html
- https://aider.chat/docs/usage/lint-test.html

---

## 三、AIVibe OS 最值得立刻吸收的 5 条

### 1. 指令栈必须分层

以后不再接受“一个超长总 prompt”当系统入口。

必须固定：

- `AGENTS.md` 作为跨工具总规则
- `CLAUDE.md` / `.claude/`
- `.cursor/rules/`
- GitHub custom agent / cloud agent 配置
- 任务级 spec / plan

### 2. 多代理执行模式必须正式化

不能继续把所有任务都塞进当前对话。

至少要区分：

- 本地结对模式
- 后台代理模式
- 云端 PR 模式

### 3. hooks 必须进入主干

危险动作、交付证据、格式化、lint、测试，不应只靠人记。

### 4. Agent profile 必须从“角色描述”升级成“可执行规范”

以前 AIVibe OS 已经有角色模板，但还不够像真正的 agent profile。

接下来需要补：

- 允许工具
- 输入输出
- 边界
- 完成证据
- 交接格式

### 5. 学习来源必须白名单化

以后默认优先级：

1. 官方文档
2. 官方仓库 / cookbook
3. 高质量开源项目源码
4. 经验文章

不要再让零散教程主导系统设计。

---

## 四、暂时不要急着吸收什么

### 1. 只属于某个平台 UI 的细节

它变得太快，不值得写进 AIVibe OS 主干。

### 2. 没有证据的“全自动自治”叙事

如果没有权限隔离、失败恢复、留痕、审计，只会把风险放大。

### 3. 只靠模型聪明、不靠系统约束的打法

这类方法短期好像快，长期最容易掉回 Demo 质量。

---

## 五、对 AIVibe OS 的直接动作建议

基于这轮研究，AIVibe OS 现在最该新增 4 类硬资产：

1. 指令栈与规则分层规范
2. 本地 / 后台 / 云端 多代理执行模式
3. hooks 强制检查规范
4. Agent profile 模板与目录规范

一句话：

**这轮升级的核心不是换模型，而是把 AIVibe OS 从文档型系统升级成多代理、分层规则、可审计的开发系统。**
