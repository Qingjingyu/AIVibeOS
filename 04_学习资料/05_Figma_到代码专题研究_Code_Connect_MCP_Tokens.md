# Figma 到代码专题研究：Code Connect / MCP / Tokens

## 研究目标

回答三个问题：

1. Figma 官方现在推荐的设计到代码链路是什么
2. 这些能力对 AIVibe OS 最值得吸收的部分是什么
3. `web-access` 这类工具应该放在这条链路的哪个位置

## 结论先说

Figma 官方已经给出一条很明确的主线：

`Figma 设计系统 -> Code Connect -> MCP -> 代码生成 / 组件复用`

它的重点不是“一键生成页面”，而是把设计组件和真实代码组件连起来，让 AI 生成结果更接近现有代码库。  
官方文档明确说 Code Connect 是连接代码仓和 Figma Dev Mode 的桥梁，并且会增强 Figma MCP 的上下文质量。  
来源：

- Figma Code Connect 介绍：<https://developers.figma.com/docs/code-connect/>
- Figma Code Connect CLI 快速开始：<https://developers.figma.com/docs/code-connect/quickstart-guide/>
- Figma MCP Code Connect 集成：<https://developers.figma.com/docs/figma-mcp-server/code-connect-integration/>

## 关键信息 1：Code Connect 是主干，不是附属功能

官方给出的推荐方式是使用模板文件，把 Figma 组件属性映射到真实代码组件。模板文件是框架无关的，可以用 `.figma.ts` 维护代码片段和属性映射。  
这意味着 AIVibe OS 以后不该把 Figma 仅仅当视觉稿，而应该把它当“组件契约的上游”。

最关键的价值有三个：

- 组件映射有真实代码路径
- 变体、布尔状态、文案内容可以映射到组件属性
- MCP 在读设计稿时能拿到真实实现上下文，而不是纯视觉猜测

## 关键信息 2：MCP 的价值在“取上下文”和“写回 Figma”

Figma MCP 不只是读图。官方工具集已经覆盖：

- `get_design_context`
- `get_variable_defs`
- `get_code_connect_map`
- `get_code_connect_suggestions`
- `use_figma`

这说明最合理的方式不是“让 AI 看截图硬还原”，而是：

- 先拉设计上下文
- 再拉变量和组件映射
- 再决定复用组件还是补新组件

来源：<https://developers.figma.com/docs/figma-mcp-server/tools-and-prompts/>

## 关键信息 3：Tokens 不应停在 Figma 内部

从实践项目看，比较成熟的路线不是停在 Figma 文件里，而是把 token 提取成 JSON，再进入代码构建链路。

值得参考的方向：

- `handoff-app`：从 Figma REST API 抽 tokens，转换成 CSS / SASS / 文档站，并支持 CI/CD 自动更新  
  <https://github.com/Convertiv/handoff-app>
- `style-dictionary`：把 tokens 作为单一来源，编译到多个平台  
  <https://github.com/style-dictionary/style-dictionary>

这说明 AIVibe OS 应该默认采用：

`Figma Variables / Tokens -> JSON -> Style Dictionary -> packages/ui`

而不是把 token 逻辑散在页面代码里。

## 关键信息 4：`web-access` 不是主干，是研究加速层

`web-access` 的价值很清楚：补上真实浏览器交互、动态页面操作、登录态站点访问和并行调研能力。  
它适合：

- 研究竞品真实页面行为
- 看设计系统官网实际交互状态
- 验证动态页面、复杂组件和多状态交互

但它不替代 Figma 官方链路。  
它更像 AIVibe OS 在研究阶段和验证阶段的一把“浏览器级放大镜”。  
来源：<https://github.com/eze-is/web-access>

## 对 AIVibe OS 的直接启发

第一，Figma 还原不能再走“截图 -> 页面”的直线，而要走“组件映射 -> token 编译 -> 页面组装”。  
第二，Code Connect 应优先从高频基础组件开始，不求一次连全。  
第三，MCP 应该成为设计到代码的默认入口。  
第四，`web-access` 应纳入研究工具栈，而不是作为主生成链路。

## 这轮研究后的建议动作

1. 先定义 `packages/ui` 的 tokens 和组件目录规则
2. 先选 Button / Input / Card / Modal 做第一批 Code Connect 映射
3. 给 AIVibe OS 补一份 `Figma 组件映射规范`
4. 设计一条 `tokens -> Style Dictionary -> CSS variables / TS constants` 的最小链路

## 一句话总结

**Figma 到代码的正确路线，不是让 AI 看图写页面，而是先把设计系统和代码系统连起来，再让 AI 在这条链路里加速。**
