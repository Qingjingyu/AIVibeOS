# AIVibe OS Figma 组件映射规范

## 目标

这份规范解决一个高频问题：

当拿到一个 Figma 设计组件时，怎么判断它应该映射到已有代码组件、扩展已有组件，还是新增组件。

目标不是追求一次映射全部，而是保证映射动作稳定、可复用、可持续扩展。

## 适用范围

这份规范优先用于高频基础组件：

- Button
- Input
- Card
- Modal
- Tabs

后续再扩到 Select、Table、Dropdown、Toast 等组件。

## 默认流程

只要是 Figma 到代码任务，默认按这个顺序走：

1. 用 MCP 取设计上下文
2. 读取变量和组件映射
3. 检查现有代码组件是否可复用
4. 再决定是映射、扩展还是新增

不允许先看图就直接写新组件。

## 判定规则 1：优先映射，不优先新增

只要满足下面 3 条中的 2 条，就优先映射到已有组件：

- 结构基本一致
- 交互行为一致
- 差异只在样式、尺寸、文案或少量状态

例如：

- 新按钮只是颜色和尺寸不同，应映射到现有 Button 变体
- 新卡片只是头部样式不同，应优先扩展 Card 插槽或变体

## 判定规则 2：扩展组件优先于复制组件

如果 Figma 组件和现有代码组件大体一致，但缺少某个状态、尺寸或插槽，应优先扩展现有组件。

允许扩展的范围：

- variant
- size
- icon slot
- loading / disabled / error state
- header / footer / actions 这类内容插槽

不允许因为一个小差异复制出一套新组件。

## 判定规则 3：只有跨越职责边界时才新增组件

只有在下面这些情况下，才考虑新增组件：

- 结构模型完全不同
- 交互逻辑完全不同
- 现有组件继续扩展会让职责变得混乱
- 这个模式预计会在多个页面重复出现

一句话：不是长得不一样就新增，而是“职责已经不是同一类东西”才新增。

## 组件映射时必须记录什么

每次映射至少要写清楚：

- Figma 组件名
- 对应代码组件名
- 组件文件路径
- 变体映射关系
- 状态映射关系
- 哪些属性来自 design tokens
- 还有哪些差异暂未覆盖

没有映射说明，后面就无法维护。

## 推荐映射表结构

建议每个组件至少维护下面这类信息：

```text
Figma: Button / Primary / Large
Code: packages/ui/src/button/Button.tsx
Variant: primary
Size: lg
State: default
Tokens: color.brand.primary, spacing.4, radius.md
Notes: icon-only state not covered yet
```

## 组件命名规则

代码组件命名优先保持稳定，不跟着 Figma 临时命名来回变。

建议：

- Figma 名称可以多层级
- 代码组件名保持简洁稳定
- Figma 侧差异通过 variant / props 映射

例如：

- Figma: `Button / Primary / Large / With Icon`
- Code: `Button` + `variant="primary"` + `size="lg"` + `iconLeft`

## 人和 AI 的分工

AI 可以负责：

- 提取 Figma 组件信息
- 对照现有代码组件做初步匹配
- 生成映射草稿
- 列出缺失状态和需要补的 props

人必须拍板：

- 是否真的属于同一组件
- 是否已经跨越职责边界
- 是否值得沉成通用能力

## 第一批落地建议

先做最常见的一批，不贪多：

1. Button
2. Input
3. Card
4. Modal
5. Tabs

每个组件先完成：

- 一个稳定的代码组件入口
- 基础 variant 和 size
- 至少 3 个常见状态
- 一份映射说明

## 一条铁规矩

**只要还能算同一类组件，就扩展它；只有职责变了，才新增它。**
