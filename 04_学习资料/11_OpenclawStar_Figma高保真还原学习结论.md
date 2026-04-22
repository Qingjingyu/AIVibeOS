# OpenclawStar Figma 高保真还原学习结论

## 这份资料解决什么问题

这份结论专门回答一个现实问题：

**如果我们想把 Figma 页面尽量一比一做成代码，到底该学什么，不该学什么。**

这次重点看的参考仓库是：

- GitHub：<https://github.com/Qingjingyu/OpenclawStar>
- 本地拉取位置：`/tmp/OpenclawStar`

我们的目标不是照搬整套仓库，而是回收其中真正能帮助 AIVibe 做高保真还原的能力。

## 结论先说

OpenclawStar 里和 Figma 设计还原最相关的，不是一个 skill，而是一套三段式组合：

1. `figma`
   负责拿 Figma 原始数据、图片、SVG、变量、组件信息。
2. `figma-implement-design`
   负责把 Figma 节点按固定流程落成项目代码。
3. `figma-pixel-replica`
   负责做高保真验收闭环，也就是截图对比、误差检查、真实交互和多状态验证。

其中最值得我们吸收的是：

- `figma-pixel-replica`
- `figma-implement-design`

原因很简单：

- `figma` 更像基础接口说明，偏“怎么拿数据”
- `figma-implement-design` 解决“怎么按顺序做”
- `figma-pixel-replica` 解决“怎么证明你真的还原对了”

## 最值得看的原始文件

下面这些原始文件已经定位清楚，后续做页面还原时可以直接回看：

- `/tmp/OpenclawStar/skills/design/figma/SKILL.md`
- `/tmp/OpenclawStar/skills/design/figma-implement-design/SKILL.md`
- `/tmp/OpenclawStar/skills/design/figma-pixel-replica/SKILL.md`
- `/tmp/OpenclawStar/bootstrap/skill_packs.sh`
- `/tmp/OpenclawStar/skills/INDEX.md`

如果只看两份，优先级是：

1. `figma-implement-design`
2. `figma-pixel-replica`

## 它到底比普通 Figma to Code 强在哪

普通做法常见问题是：

- 只看截图，很多参数靠猜
- 素材没下载全，图标和图像被随手替代
- 页面看着像，但状态不全
- 做完没有验收证据，只能靠肉眼吵来吵去

OpenclawStar 这套更强的地方在于，它不是只追求“生成代码”，而是把还原过程拆成了一个闭环：

`拿原始设计 -> 拉原始素材 -> 实现页面 -> 截图对比 -> 修小差值 -> 跑真实交互 -> 验收`

这比“Figma 截图看着写”高一个层级。

## 从 OpenclawStar 提炼出来的核心方法论

### 1. 先拿权威输入，不准靠猜

在动手前，先把这些东西拿齐：

- Figma file key
- node id
- design context
- screenshot
- 原始图片
- 原始 SVG
- 变量和组件信息

说白了，就是先把“标准答案”拿到手，再写代码。

### 2. 页面还原和业务可用，要一起做

`figma-pixel-replica` 很强调一点：

**页面不能只是像，还得能用。**

所以它不接受这种假完成：

- 页面长得对
- 但按钮没逻辑
- 表单没校验
- 状态只有 happy path

以后我们做登录页、创作页、分享页，都要带着这个标准走。

### 3. 先冻结状态，再调样式

OpenclawStar 里有一个很重要的思路叫 state matrix。

意思是：

- 这个页面有哪些状态
- 谁触发它
- 请求成功时长什么样
- 失败时长什么样
- 超时时长什么样

只有这些先想清楚，后面的视觉微调才不会反复返工。

### 4. 不要空口说像素级，要拿证据

这个仓库最有价值的一点，是它要求截图对比和差异检查。

它的思路不是：

- “我觉得已经差不多了”

而是：

- 拉 Figma 图
- 拉当前页面图
- 做 diff
- 看误差有没有明显下降

这件事特别适合我们后续做关键页面验收。

### 5. 不能把还原任务偷偷变成设计任务

这个仓库反复强调一件事：

**如果任务是还原，就不要一边做一边自己改设计。**

这和我们现在的要求完全一致。

所以以后做 Figma 还原时：

- 不擅自换图标
- 不擅自换文案
- 不擅自换比例
- 不擅自补“我觉得更好看”的视觉

先还原，再讨论优化。

## 对我们最有帮助的 SOP

结合 OpenclawStar 和我们本机已有的 Figma skill，AIVibe 以后做 Figma 高保真页面，建议固定走这 8 步：

1. 明确页面 URL、file key、node id
2. 用 MCP 拉 `design context`、`screenshot`、变量、素材
3. 把原始图片和 SVG 下载到本地素材目录
4. 先写页面状态表，不急着调像素
5. 用原始参数和原始素材搭第一版页面
6. 启动页面，对照 Figma 截图做一轮轮微调
7. 对关键状态做 smoke 检查，确认不是空壳
8. 输出验收证据，再宣布完成

## 它和我们本机已有 skill 怎么组合

我们本机已经有三份非常关键的本地 skill：

- `figma-to-code`
- `figma-screen-to-code-with-original-assets`
- `figma-mcp-analysis`

最合理的组合不是二选一，而是拼起来用：

### 第一层：拿数据

- 用 `figma-mcp-analysis`
- 用 OpenclawStar 的 `figma`

目标是把页面结构、关键节点、素材、参数先摸清。

### 第二层：搭页面

- 用 `figma-to-code`
- 用 `figma-screen-to-code-with-original-assets`
- 用 OpenclawStar 的 `figma-implement-design`

目标是坚持原素材、原内容、原参数，而不是靠截图糊背景。

### 第三层：做验收

- 用 OpenclawStar 的 `figma-pixel-replica`

目标是把“我觉得像”升级成“我能证明它接近原稿”。

## AIVibe 后续应吸收的硬规则

基于这次学习，建议把下面这些规则纳入 AIVibe 的 Figma 还原默认动作：

1. 没拿到 design context 和 screenshot，不开始写页面。
2. 关键页面优先用原始素材，不用替代图标包糊弄。
3. 还原任务里，禁止自己顺手改设计。
4. 页面验收不能只看首页静态图，必须看关键状态。
5. 不再用“差不多像”作为完成标准。
6. 关键页面最好保留截图对比证据。

## 这一轮最重要的一句话

**OpenclawStar 真正值得学的，不是“又一个 Figma skill”，而是它把 Figma 还原从“凭感觉写前端”，升级成了“有原始输入、有过程约束、有验收证据”的完整闭环。**
