# AIVibe OS Roadmap

## 最终目标

AIVibe OS 的最终目标，不是做出一个单独的 agent，也不是做一堆文档模板。

它要成为一套可重复交付生产级产品的人机协同开发系统，至少同时具备：

- 统一开发流程
- 统一工程骨架
- 统一 Figma 到代码链路
- 统一 AI 调用与评测体系
- 统一质量、发布与回滚标准
- 明确的人与 Agent 分工
- 可持续沉淀和复用的知识库

## 总体策略

路线不是“先空想完整系统”，也不是“边做边乱长”。

采用下面这条闭环：

`研究外部项目 -> 提炼可复用能力 -> 沉淀为 AIVibe OS 规则/模板/模块 -> 用 AIVibe OS 自己实践 -> 复盘修正`

一句话：**边研究，边建设，边验证。**

## 当前总进度

按 2026-04-22 当前状态，整体进度约为 **97%**。

当前判断：

- Phase 1 已基本完成
- Phase 2 已启动，Figma 专题完成第一轮
- Phase 3 / 4 / 5 / 6 / 7 已从概念进入执行模板阶段
- 2026 这一轮最新的 agentic coding 范式，已经开始回灌成正式系统规则
- 还没有真正进入“项目模板代码化”和“真实项目闭环验证”

## Phase 1：母文档与原则定盘

目标：先把语言、边界和目标说清楚。

交付物：

- [001_AIVibe_OS_定义与愿景.md](./001_AIVibe_OS_定义与愿景.md)
- [002_AIVibe_OS_v1_核心模块.md](./002_AIVibe_OS_v1_核心模块.md)
- [003_AIVibe_OS_标准开发流程.md](./003_AIVibe_OS_标准开发流程.md)
- [004_AIVibe_OS_工程骨架.md](./004_AIVibe_OS_工程骨架.md)
- [005_AIVibe_OS_Figma_到代码流水线.md](./005_AIVibe_OS_Figma_到代码流水线.md)
- [006_AIVibe_OS_AI_调用与评测体系.md](./006_AIVibe_OS_AI_调用与评测体系.md)
- [007_AIVibe_OS_质量与发布标准.md](./007_AIVibe_OS_质量与发布标准.md)

状态：**90%**

下一步：

- 后续只做小修，不再作为主战场

## Phase 2：研究驱动的能力吸收

目标：系统研究外部参考项目，把“值得学的能力”变成 AIVibe OS 的内部资产。

每轮研究都必须产出：

- 一份研究结论
- 一份能力拆解
- 一条应纳入 AIVibe OS 的规则
- 一个模板、模块或脚手架需求

优先研究专题：

1. Figma 到代码与设计令牌
2. AI 调用网关、日志与评测
3. 工程骨架、模块边界与共享层
4. 长任务、重试、恢复与异步流程
5. QA、发布、监控与回滚

已完成：

- [05_Figma_到代码专题研究_Code_Connect_MCP_Tokens.md](../04_学习资料/05_Figma_到代码专题研究_Code_Connect_MCP_Tokens.md)
- [008_AIVibe_OS_Figma_专题吸收决策.md](./008_AIVibe_OS_Figma_专题吸收决策.md)
- [06_AI_Runtime_专题研究_Tracing_Guardrails_Durability.md](../04_学习资料/06_AI_Runtime_专题研究_Tracing_Guardrails_Durability.md)
- [048_AIVibe_OS_AI_Runtime_专题吸收决策.md](./048_AIVibe_OS_AI_Runtime_专题吸收决策.md)
- [07_长任务与恢复专题研究_Durability_HITL_Tracing.md](../04_学习资料/07_长任务与恢复专题研究_Durability_HITL_Tracing.md)
- [053_AIVibe_OS_长任务专题吸收决策.md](./053_AIVibe_OS_长任务专题吸收决策.md)
- [08_工程骨架专题研究_Monorepo_Sharing_Scaffolding.md](../04_学习资料/08_工程骨架专题研究_Monorepo_Sharing_Scaffolding.md)
- [060_AIVibe_OS_工程骨架专题吸收决策.md](./060_AIVibe_OS_工程骨架专题吸收决策.md)
- [09_产品能力专题研究_PMF_MVP_策略_实验.md](../04_学习资料/09_产品能力专题研究_PMF_MVP_策略_实验.md)
- [071_AIVibe_OS_产品能力学习方案.md](./071_AIVibe_OS_产品能力学习方案.md)
- [072_AIVibe_OS_产品能力专题吸收决策.md](./072_AIVibe_OS_产品能力专题吸收决策.md)
- [10_产品设计专题研究_用户研究_ProductSense_原型验证.md](../04_学习资料/10_产品设计专题研究_用户研究_ProductSense_原型验证.md)
- [073_AIVibe_OS_产品设计专题吸收决策.md](./073_AIVibe_OS_产品设计专题吸收决策.md)
- [074_AIVibe_OS_用户访谈提纲.md](./074_AIVibe_OS_用户访谈提纲.md)
- [075_AIVibe_OS_Product_Sense_判断清单.md](./075_AIVibe_OS_Product_Sense_判断清单.md)
- [076_AIVibe_OS_原型验证模板.md](./076_AIVibe_OS_原型验证模板.md)
- [077_AIVibe_OS_产品实验模板.md](./077_AIVibe_OS_产品实验模板.md)
- [078_AIVibe_OS_PMF_判断清单.md](./078_AIVibe_OS_PMF_判断清单.md)
- [079_AIVibe_OS_从问题到原型_执行手册.md](./079_AIVibe_OS_从问题到原型_执行手册.md)
- [080_AIVibe_OS_DESIGN_MD_视觉执行规范.md](./080_AIVibe_OS_DESIGN_MD_视觉执行规范.md)
- [12_2026_AI_Coding_工作流专题研究.md](../04_学习资料/12_2026_AI_Coding_工作流专题研究.md)
- [098_AIVibe_OS_2026_AI_Coding_专题吸收决策.md](./098_AIVibe_OS_2026_AI_Coding_专题吸收决策.md)
- [103_AIVibe_OS_Skill_标准.md](./103_AIVibe_OS_Skill_标准.md)
- [104_AIVibe_OS_Command_to_Skill_映射.md](./104_AIVibe_OS_Command_to_Skill_映射.md)
- [105_AIVibe_OS_Skill_Anatomy_模板.md](./105_AIVibe_OS_Skill_Anatomy_模板.md)
- [106_AIVibe_OS_反偷懒与验证机制.md](./106_AIVibe_OS_反偷懒与验证机制.md)

状态：**99%**

下一步：

- 继续补真实实验与实战记录
- 用一个真实项目验证 `DESIGN.md + Figma + Spec` 的组合效果
- 用一个真实项目验证 `指令栈 + 多代理模式 + hooks` 的组合效果
- 用一个真实项目验证 `command -> skill -> hooks -> evidence` 的组合效果

## Phase 3：标准项目模板

目标：让新项目不用从零开工。

核心交付：

- monorepo 模板
- web / api / worker 基础骨架
- packages/ui / shared / ai / config 基础结构
- 环境变量模板
- lint / test / build 基础命令

验收标准：

- 能 30 分钟内起一个新项目
- 前后端可以并行开发
- AI 能力有统一出口

已完成：

- [013_AIVibe_OS_标准项目仓模板.md](./013_AIVibe_OS_标准项目仓模板.md)
- [026_AIVibe_OS_Env_模板规范.md](./026_AIVibe_OS_Env_模板规范.md)
- [027_AIVibe_OS_Monorepo_初始化清单.md](./027_AIVibe_OS_Monorepo_初始化清单.md)
- [028_AIVibe_OS_最小目录脚手架说明.md](./028_AIVibe_OS_最小目录脚手架说明.md)
- [039_AIVibe_OS_基础命令模板.md](./039_AIVibe_OS_基础命令模板.md)
- [040_AIVibe_OS_健康检查模板.md](./040_AIVibe_OS_健康检查模板.md)
- [047_AIVibe_OS_最小README_启动模板.md](./047_AIVibe_OS_最小README_启动模板.md)
- [060_AIVibe_OS_工程骨架专题吸收决策.md](./060_AIVibe_OS_工程骨架专题吸收决策.md)
- [061_AIVibe_OS_Shared_Layer_边界规范.md](./061_AIVibe_OS_Shared_Layer_边界规范.md)
- [062_AIVibe_OS_Package_依赖规则.md](./062_AIVibe_OS_Package_依赖规则.md)
- [063_AIVibe_OS_项目模板生成策略.md](./063_AIVibe_OS_项目模板生成策略.md)
- [064_AIVibe_OS_脚手架参数样例.md](./064_AIVibe_OS_脚手架参数样例.md)
- [065_AIVibe_OS_最小Package_命令样例.md](./065_AIVibe_OS_最小Package_命令样例.md)
- [069_AIVibe_OS_知识包规范.md](./069_AIVibe_OS_知识包规范.md)
- [070_AIVibe_OS_统一检索入口规范.md](./070_AIVibe_OS_统一检索入口规范.md)

状态：**95%**

下一步：

- 开始准备项目模板代码化
- 补模板代码化草案

## Phase 4：Design Pipeline 落地

目标：把 Figma 还原从“手工页面活”变成“可复用资产生产线”。

核心交付：

- design tokens 规范
- 基础组件清单
- 页面模块清单
- Figma 到组件的映射规则
- 至少一个真实页面的完整还原样例

验收标准：

- 同类组件不重复造
- 新页面优先拼模块，不从零画

已完成：

- [008_AIVibe_OS_Figma_专题吸收决策.md](./008_AIVibe_OS_Figma_专题吸收决策.md)
- [009_AIVibe_OS_Figma_组件映射规范.md](./009_AIVibe_OS_Figma_组件映射规范.md)
- [010_AIVibe_OS_Tokens_编译链路.md](./010_AIVibe_OS_Tokens_编译链路.md)
- [011_AIVibe_OS_最小设计到代码闭环实验.md](./011_AIVibe_OS_最小设计到代码闭环实验.md)
- [024_AIVibe_OS_Figma_组件映射记录模板.md](./024_AIVibe_OS_Figma_组件映射记录模板.md)
- [025_AIVibe_OS_Tokens_Source_Build_模板.md](./025_AIVibe_OS_Tokens_Source_Build_模板.md)
- [029_AIVibe_OS_页面模块清单模板.md](./029_AIVibe_OS_页面模块清单模板.md)
- [030_AIVibe_OS_设计到代码实验记录模板.md](./030_AIVibe_OS_设计到代码实验记录模板.md)
- [066_AIVibe_OS_真实Figma闭环执行计划.md](./066_AIVibe_OS_真实Figma闭环执行计划.md)

状态：**68%**

下一步：

- 找真实页面跑第一轮闭环实验
- 产出第一次实验结果

## Phase 5：AI Runtime 落地

目标：让 AI 功能从“能调模型”升级成“可观察、可评测、可降级”。

核心交付：

- `packages/ai` 初版
- 模型提供方适配层
- 提示词版本管理
- 调用日志标准
- 评测样本与回放机制
- 降级策略模板

验收标准：

- 同一个 AI 能力可以切模型
- 关键调用可以追踪、回放、比对

已完成：

- [015_AIVibe_OS_AI_Runtime_目录设计.md](./015_AIVibe_OS_AI_Runtime_目录设计.md)
- [016_AIVibe_OS_AI_Task_封装规范.md](./016_AIVibe_OS_AI_Task_封装规范.md)
- [017_AIVibe_OS_AI_Evals_评测规范.md](./017_AIVibe_OS_AI_Evals_评测规范.md)
- [022_AIVibe_OS_AI_Task_模板.md](./022_AIVibe_OS_AI_Task_模板.md)
- [023_AIVibe_OS_AI_Evals_模板.md](./023_AIVibe_OS_AI_Evals_模板.md)
- [031_AIVibe_OS_AI_日志字段模板.md](./031_AIVibe_OS_AI_日志字段模板.md)
- [032_AIVibe_OS_Prompt_版本模板.md](./032_AIVibe_OS_Prompt_版本模板.md)
- [033_AIVibe_OS_Provider_适配规范.md](./033_AIVibe_OS_Provider_适配规范.md)
- [041_AIVibe_OS_AI_降级策略模板.md](./041_AIVibe_OS_AI_降级策略模板.md)
- [042_AIVibe_OS_Runtime_回放记录模板.md](./042_AIVibe_OS_Runtime_回放记录模板.md)
- [048_AIVibe_OS_AI_Runtime_专题吸收决策.md](./048_AIVibe_OS_AI_Runtime_专题吸收决策.md)
- [050_AIVibe_OS_Guardrails_规范.md](./050_AIVibe_OS_Guardrails_规范.md)
- [051_AIVibe_OS_Tracing_模型.md](./051_AIVibe_OS_Tracing_模型.md)
- [052_AIVibe_OS_长任务与恢复机制.md](./052_AIVibe_OS_长任务与恢复机制.md)
- [053_AIVibe_OS_长任务专题吸收决策.md](./053_AIVibe_OS_长任务专题吸收决策.md)
- [054_AIVibe_OS_HITL_中断与恢复规范.md](./054_AIVibe_OS_HITL_中断与恢复规范.md)
- [055_AIVibe_OS_长任务状态模型.md](./055_AIVibe_OS_长任务状态模型.md)
- [056_AIVibe_OS_Trace_Span_Event_模板.md](./056_AIVibe_OS_Trace_Span_Event_模板.md)
- [058_AIVibe_OS_Runtime_回放样本样例.md](./058_AIVibe_OS_Runtime_回放样本样例.md)
- [059_AIVibe_OS_HITL_演练记录_样例.md](./059_AIVibe_OS_HITL_演练记录_样例.md)
- [067_AIVibe_OS_真实业务链路替换清单.md](./067_AIVibe_OS_真实业务链路替换清单.md)

状态：**97%**

下一步：

- 用真实业务链路替换当前样例记录

## Phase 6：质量与发布闭环

目标：让“能跑”变成“敢发”。

核心交付：

- 完成定义
- QA 执行模板
- 发布检查单
- 回滚模板
- 监控与日志检查规则

验收标准：

- 每次发布前都有明确证据
- 每次出问题都能定位和回滚

已完成：

- [014_AIVibe_OS_完成定义_DoD.md](./014_AIVibe_OS_完成定义_DoD.md)
- [018_AIVibe_OS_QA_执行模板.md](./018_AIVibe_OS_QA_执行模板.md)
- [019_AIVibe_OS_发布与回滚模板.md](./019_AIVibe_OS_发布与回滚模板.md)
- [034_AIVibe_OS_监控检查模板.md](./034_AIVibe_OS_监控检查模板.md)
- [035_AIVibe_OS_日志验证模板.md](./035_AIVibe_OS_日志验证模板.md)
- [036_AIVibe_OS_发布后复盘模板.md](./036_AIVibe_OS_发布后复盘模板.md)
- [043_AIVibe_OS_回滚演练模板.md](./043_AIVibe_OS_回滚演练模板.md)
- [044_AIVibe_OS_监控指标基线说明.md](./044_AIVibe_OS_监控指标基线说明.md)
- [049_AIVibe_OS_发布事故记录模板.md](./049_AIVibe_OS_发布事故记录模板.md)

状态：**90%**

下一步：

- 用一次真实发布或演练回填事故/复盘记录

## Phase 7：Agent 分工与自动执行

目标：让 AIVibe OS 不只是一套文档，而是能驱动真实协作。

核心交付：

- 产品 Agent 职责定义
- 设计 Agent 职责定义
- 前端 / 后端 / QA / Review Agent 职责定义
- Agent 输入输出模板
- Agent 之间的交接规则

验收标准：

- 一个明确需求能按固定节奏被多角色协同推进

已完成：

- [012_AIVibe_OS_Agent_分工体系.md](./012_AIVibe_OS_Agent_分工体系.md)
- [021_AIVibe_OS_Agent_交接模板.md](./021_AIVibe_OS_Agent_交接模板.md)
- [037_AIVibe_OS_Agent_角色输入输出模板.md](./037_AIVibe_OS_Agent_角色输入输出模板.md)
- [038_AIVibe_OS_多Agent_任务推进示例.md](./038_AIVibe_OS_多Agent_任务推进示例.md)
- [045_AIVibe_OS_Agent_执行节奏示例.md](./045_AIVibe_OS_Agent_执行节奏示例.md)
- [046_AIVibe_OS_多角色闭环实战记录模板.md](./046_AIVibe_OS_多角色闭环实战记录模板.md)
- [057_AIVibe_OS_自举闭环记录_第一轮.md](./057_AIVibe_OS_自举闭环记录_第一轮.md)
- [067_AIVibe_OS_真实业务链路替换清单.md](./067_AIVibe_OS_真实业务链路替换清单.md)
- [099_AIVibe_OS_指令栈与规则分层规范.md](./099_AIVibe_OS_指令栈与规则分层规范.md)
- [100_AIVibe_OS_多代理执行模式_本地_后台_云端.md](./100_AIVibe_OS_多代理执行模式_本地_后台_云端.md)
- [101_AIVibe_OS_Hooks_强制检查规范.md](./101_AIVibe_OS_Hooks_强制检查规范.md)
- [102_AIVibe_OS_Agent_Profile_模板与目录规范.md](./102_AIVibe_OS_Agent_Profile_模板与目录规范.md)
- [103_AIVibe_OS_Skill_标准.md](./103_AIVibe_OS_Skill_标准.md)
- [104_AIVibe_OS_Command_to_Skill_映射.md](./104_AIVibe_OS_Command_to_Skill_映射.md)
- [105_AIVibe_OS_Skill_Anatomy_模板.md](./105_AIVibe_OS_Skill_Anatomy_模板.md)
- [106_AIVibe_OS_反偷懒与验证机制.md](./106_AIVibe_OS_反偷懒与验证机制.md)

状态：**95%**

下一步：

- 用真实任务跑一次本地 / 后台 / 云端分流闭环
- 把现有角色补成可直接实例化的 profile
- 把最关键的 7 条 command 跑成真实 skill 闭环

## 当前优先级

现在不要急着做复杂平台界面，也不要急着追求全自动自治。

当前优先级应是：

1. 研究驱动的能力吸收
2. Skill / Command / Hooks 执行层
3. 标准项目模板
4. Figma 到代码流水线
5. AI Runtime
6. 质量与发布闭环
7. Agent 分工体系

## 当前执行顺序

从现在开始，优先按下面顺序推进：

1. 选一个真实链路做第一次闭环验证
2. 把剩余工程模板补齐
3. 把 Phase 3 的项目模板进一步代码化
4. 开启 AI Runtime 第二轮研究吸收

## 当前工作方法

从现在开始，所有任务都按这个判断：

- 它属于 AIVibe OS 的哪一层能力
- 它会沉淀成规则、模板、模块还是流程
- 它是否能被后续多个产品复用

不能沉淀进系统的工作，优先级下降。

## 一句话路线

**先把 AIVibe OS 做成自己的开发底座，再用它去做更多产品，并反过来继续强化它。**
