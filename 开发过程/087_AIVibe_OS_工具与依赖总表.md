# AIVibe OS 工具与依赖总表

## 这份文档解决什么问题

AIVibe OS 现在已经有很多“武器”了：

- MCP
- 本地 skill
- 外部参考仓
- 浏览器自动化
- 文档模板
- 能力包

问题是，如果这些东西没有总表，后面就会出现很典型的情况：

- 明明以前用过，但找不到
- 不知道它解决什么问题
- 不知道什么时候该用它
- 不知道它有没有被真实验证过

这份文档的目标，就是把 AIVibe OS 目前已经确认可用、值得长期记住的工具和依赖，统一登记起来。

一句话：

**以后先查总表，再动手，不要靠记忆找武器。**

---

## 一、登记原则

只有满足下面任意一条的工具，才值得进总表：

1. 已在真实任务中用过
2. 对关键链路有明显价值
3. 很容易忘，但一旦想起就很好用
4. 是某条能力的必要依赖

如果只是“听说不错”，先不要登记。

---

## 二、统一字段

以后登记一个工具或依赖，默认写清下面这些字段：

- 名称
- 类型
- 解决什么问题
- 什么时候用
- 主要入口
- 当前状态
- 已验证场景
- 风险或限制
- 替代方案

这样以后查起来才有意义。

---

## 三、当前核心工具与依赖

### 1. Figma MCP

- 类型：设计取数与设计上下文工具
- 解决什么问题：从 Figma 拿结构、截图、变量、素材、设计上下文
- 什么时候用：做 Figma 到代码、设计分析、组件映射时
- 主要入口：Figma MCP 相关工具调用
- 当前状态：已确认可用
- 已验证场景：Sonora 页面高保真还原
- 风险或限制：拿到的是设计信息，不等于自动变成好代码；仍然需要结构化实现
- 替代方案：手工截图分析，效率和准确度都更差

### 2. Playwright

- 类型：浏览器自动化与页面截图工具
- 解决什么问题：自动打开页面、截图、走基础交互、做对稿
- 什么时候用：页面验收、截图留证、对比本地页面时
- 主要入口：本机 `playwright` skill 与 `npx playwright` 命令
- 当前状态：已确认可用
- 已验证场景：本地 Sonora 页面截图验收
- 风险或限制：它能帮你看到页面，不会替你做审美判断
- 替代方案：人工手点浏览器，慢且不稳定

### 3. Top能力/Figmatocode

- 类型：能力包
- 解决什么问题：高保真 Figma 到代码落地
- 什么时候用：页面要求还原、原素材优先、需要可验收证据时
- 主要入口：`Top能力/Figmatocode/README.md`
- 当前状态：已验证、可独立打包分享
- 已验证场景：Sonora 分享页真实开发
- 风险或限制：还不是全自动产品；复杂页面仍需要人工判断和对稿
- 替代方案：只靠截图瞎写页面，质量明显不稳定

### 4. 本机 Hermes Figma skill

- 类型：本地能力来源
- 解决什么问题：提供现成的 Figma to Code、原始素材还原、分析打法参考
- 什么时候用：需要补强 Figma 工作流、找成熟技能时
- 主要入口：
  - `$HOME/.hermes/skills/software-development/figma-to-code/SKILL.md`
  - `$HOME/.hermes/skills/software-development/figma-screen-to-code-with-original-assets/SKILL.md`
  - `$HOME/.hermes/skills/mcp/figma-mcp-analysis/SKILL.md`
- 当前状态：已验证为重要来源
- 已验证场景：Figmatocode 能力包抽取与实战落地
- 风险或限制：是来源，不是最终交付；需要吸收后变成我们自己的规范
- 替代方案：自己从零摸索，速度慢很多

### 5. OpenclawStar 参考仓

- 类型：外部参考仓
- 解决什么问题：提供 Figma 高保真还原、截图对稿、流水线设计参考
- 什么时候用：设计到代码方法研究、脚本参考、SOP 提炼时
- 主要入口：
  - GitHub：`https://github.com/Qingjingyu/OpenclawStar`
  - 本地：`/tmp/OpenclawStar`
- 当前状态：已学习并吸收部分方法
- 已验证场景：Figma skill、pixel replica 思路、脚本参考
- 风险或限制：不能整仓照搬，必须结合我们自己的系统边界
- 替代方案：散着找资料，信息密度更低

### 6. 开发过程/020_AIVibe_OS_总索引.md

- 类型：系统入口文档
- 解决什么问题：给 AIVibe OS 提供统一导航
- 什么时候用：任何第一次进仓、找模块入口、找场景路径时
- 主要入口：`开发过程/020_AIVibe_OS_总索引.md`
- 当前状态：已在用
- 已验证场景：本次自我优化过程中的入口挂载
- 风险或限制：如果长期不维护，会重新变成“有索引但不好用”
- 替代方案：靠全文搜索硬找，成本更高

### 7. 开发过程/083_AIVibe_OS_新项目最小启动路径.md

- 类型：入口型规则文档
- 解决什么问题：告诉新项目第一天先干什么
- 什么时候用：新项目启动、项目重开、团队新人接手时
- 主要入口：`开发过程/083_AIVibe_OS_新项目最小启动路径.md`
- 当前状态：已建立
- 已验证场景：AIVibe 自我优化入口补强
- 风险或限制：如果后续流程变了而不更新，会误导人
- 替代方案：翻操作手册和总索引自己拼路径

### 8. scripts/governance/run-aivibe-closeout.sh

- 类型：治理收尾脚本
- 解决什么问题：把阶段检查、工具台账、自举看板收成一条固定收尾动作
- 什么时候用：每轮补完 AIVibe OS、调整治理脚本后、准备对外汇报前
- 主要入口：`scripts/governance/run-aivibe-closeout.sh`
- 当前状态：已验证
- 已验证场景：本次 AIVibe 自我优化收尾
- 风险或限制：它只能收结果，不能替代人工判断哪些内容该回写母文档
- 替代方案：手工分别跑 3 到 4 条脚本，稳定性更差

### 第二梯队：已完成官方方法验证，待更多本仓实战验证

### 9. Claude Code

- 类型：本地结对与多代理开发工具
- 解决什么问题：把仓库规则、子代理、hooks、MCP 接进持续开发环境
- 什么时候用：本地高上下文任务、复杂架构任务、需要并行子代理时
- 主要入口：
  - `https://code.claude.com/docs/en/best-practices`
  - `https://code.claude.com/docs/en/memory`
  - `https://code.claude.com/docs/en/sub-agents`
- 当前状态：已完成官方方法验证，待更多本仓实战验证
- 已验证场景：AIVibe OS 自举与文档治理
- 风险或限制：规则层如果不分层，仍然会长成超长 prompt
- 替代方案：只用单代理聊天式 coding，稳定性更差

### 10. OpenAI Codex（CLI / app）

- 类型：本地结对 + 异步代理工具
- 解决什么问题：本地代码协作、异步任务委托、skills 复用
- 什么时候用：需要本地快迭代，或需要把独立任务异步交出去时
- 主要入口：
  - `https://developers.openai.com/codex/cli`
  - `https://openai.com/index/introducing-the-codex-app/`
- 当前状态：已完成官方方法验证，待更多本仓实战验证
- 已验证场景：AIVibe OS 自举、独立脱敏包生成
- 风险或限制：如果没有清晰的 instruction stack，异步代理同样会跑偏
- 替代方案：完全手工分派任务，速度更慢

### 11. GitHub Copilot coding agent / custom agents

- 类型：云端 PR 代理
- 解决什么问题：把边界清楚的任务放到隔离环境里改分支、提 PR、走审计
- 什么时候用：需要权限边界、审计链路、远端异步实现时
- 主要入口：
  - `https://docs.github.com/en/copilot/concepts/coding-agent/about-copilot-coding-agent`
  - `https://docs.github.com/en/copilot/how-tos/copilot-sdk/use-copilot-sdk/custom-agents`
- 当前状态：已完成官方方法验证，待更多本仓实战验证
- 已验证场景：文档级研究吸收
- 风险或限制：边界不清的任务丢给云端，会把 review 成本抬得更高
- 替代方案：所有改动都留在本地同步做

### 12. Cursor Background Agents

- 类型：后台代理
- 解决什么问题：让长任务和 side task 不再长期占住主对话
- 什么时候用：批量改动、长任务、可异步回收的任务
- 主要入口：
  - `https://docs.cursor.com/background-agents`
  - `https://docs.cursor.com/context/rules`
- 当前状态：已完成官方方法验证，待更多本仓实战验证
- 已验证场景：工作流研究吸收
- 风险或限制：不适合边界不清或高风险任务
- 替代方案：所有任务都在当前会话里同步推进

### 13. Aider

- 类型：工程闭环参考工具
- 解决什么问题：提醒团队坚持 architect / code 分工、lint / test 闭环、conventions
- 什么时候用：梳理工程型 AI coding 基线时
- 主要入口：
  - `https://aider.chat/docs/usage/modes.html`
  - `https://aider.chat/docs/usage/conventions.html`
  - `https://aider.chat/docs/usage/lint-test.html`
- 当前状态：已完成官方方法验证，待更多本仓实战验证
- 已验证场景：本轮 2026 AI coding 专题刷新
- 风险或限制：它更像硬工程参考，不是完整的团队操作系统
- 替代方案：只看大厂 agent 产品，不看工程闭环方法

### 14. agents.md

- 类型：仓库级 agent 说明约定
- 解决什么问题：给跨工具协作提供统一入口
- 什么时候用：需要让不同 coding agent 共享一套仓库说明时
- 主要入口：
  - `https://agents.md/`
  - `https://github.com/agentsmd/agents.md`
- 当前状态：已完成方法验证
- 已验证场景：AIVibe OS 当前的 `AGENTS.md` 主入口
- 风险或限制：它只解决入口，不自动解决规则分层和 hooks
- 替代方案：每个工具自己维护一套独立总规则

### 15. AIVibe Skills / Commands

- 类型：正式执行层
- 解决什么问题：把命令入口、Skill 工作流、验证和交接固定下来
- 什么时候用：正式开发任务按阶段推进时
- 主要入口：
  - `commands/README.md`
  - `skills/README.md`
- 当前状态：已落地第一批核心技能
- 已验证场景：AIVibe OS 自举优化
- 风险或限制：目前还是第一批，安全、性能、调试等扩展技能还没全部落地
- 替代方案：只靠总规则和临时 prompt 触发工作流

### 16. Claude / Cursor Adapter Layer

- 类型：工具适配层
- 解决什么问题：把 AIVibe OS 的 root rules、commands、skills 正式接进具体工具
- 什么时候用：要在 Claude Code、Cursor、Codex-compatible 环境里直接使用 AIVibe OS 时
- 主要入口：
  - `AGENTS.md`
  - `CLAUDE.md`
  - `.claude/rules/`
  - `.cursor/rules/`
  - `.cursor/commands/`
- 当前状态：已落地第一版
- 已验证场景：AIVibe OS 自举优化
- 风险或限制：当前仍以 Claude / Cursor 为主，更多工具适配还可继续补
- 替代方案：每个工具各写一套独立规则，长期会漂

### 17. Claude Project Skills / Agents

- 类型：Claude 项目级执行层
- 解决什么问题：把 AIVibe OS 的 stage commands 和 agent 分工直接落进 Claude Code 项目上下文
- 什么时候用：需要在 Claude Code 里直接使用 `/spec /plan /build /test /review /code-simplify /ship` 或使用项目级 subagents 时
- 主要入口：
  - `.claude/skills/`
  - `.claude/agents/`
- 当前状态：已落地第一版
- 已验证场景：AIVibe OS 自举优化
- 风险或限制：当前还是第一批 agent 实例，后续还应继续补工具边界更细的 agent
- 替代方案：只依赖 `CLAUDE.md` 和临时提示，不建立项目级 skills / agents

### 18. AIVibe Meta Skills / Office Hours

- 类型：元能力层
- 解决什么问题：让系统在开工前更会想、卡住时更会升级、完成前更会自证、合并前更会卡门
- 什么时候用：需求模糊、争议大、连续失败、准备宣称完成、准备做最终 gate 时
- 主要入口：
  - `skills/brainstorming-and-discovery/SKILL.md`
  - `skills/office-hours/SKILL.md`
  - `skills/systematic-debugging/SKILL.md`
  - `skills/verification-before-completion/SKILL.md`
  - `skills/review-gate/SKILL.md`
  - `.claude/agents/office-hours-*`
- 当前状态：已落地第一版
- 已验证场景：AIVibe OS 自举优化
- 风险或限制：当前还是系统级通用版，还没用真实产品项目做高强度闭环验证
- 替代方案：继续让默认实现路径承担所有模糊决策和高风险判断

---

## 四、推荐使用顺序

以后默认按这个顺序选工具，不要乱。

### 1. 先找入口文档

先确认自己在做什么任务。

### 2. 再找对应能力包

比如 Figma 到代码，就先看 `Top能力/Figmatocode/`。

### 3. 再找底层工具

比如 Figma MCP、Playwright、脚本、外部参考仓。

### 4. 最后才补外部搜索

先用已验证过的东西。

只有不够时，再去外面找新武器。

---

## 五、可直接复制的工具登记模板

以后新增一个工具或依赖，直接按下面格式补。

```md
### 工具名

- 类型：
- 解决什么问题：
- 什么时候用：
- 主要入口：
- 当前状态：
- 已验证场景：
- 风险或限制：
- 替代方案：
```

---

## 六、哪些东西应该优先继续补进总表

结合现在的状态，后面最值得继续登记的是：

1. 所有已验证过的 MCP
2. 所有真正反复使用的本地 skill
3. 所有关键自动化脚本
4. 所有对外依赖的配置入口
5. 所有已经成型的 Top能力
6. 所有已经确认值得接入的多代理执行平台

这样后面做自动化产品时，就不会重新盘资产。

---

## 七、最容易犯的错

### 1. 只记名字，不记用途

这样总表没有用。

### 2. 把没验证过的工具也写进来

这样会污染判断。

### 3. 不记录限制

最后大家会把工具当万能件乱用。

### 4. 只登记外部工具，不登记内部能力

其实 `Top能力`、入口文档、模板，本身也是系统依赖的一部分。

---

## 一句话铁规矩

**工具总表的目的，不是显得我们工具很多，而是让下一次出手更快、更准、更稳。**
