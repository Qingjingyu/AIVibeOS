# AIVibe OS Tokens 编译链路

## 目标

这份文档解决一个关键问题：

Figma 里的颜色、字体、间距、圆角这些设计变量，怎么稳定地进入代码，而不是散落在页面和组件里手写。

目标是建立一条清晰、可重复、可扩展的 token 编译链路。

## 标准方向

AIVibe OS 默认采用这条链路：

```text
Figma Variables / Tokens
-> JSON
-> Style Dictionary
-> packages/ui
-> CSS Variables / TS Constants / Theme Tokens
```

一句话：设计变量先变成统一数据，再编译成代码可直接使用的资产。

## 每一层负责什么

### 1. Figma Variables / Tokens

这是设计源头。

它负责表达：

- 品牌色
- 中性色
- 字体族
- 字号
- 间距
- 圆角
- 阴影
- 栅格

Figma 里只负责定义，不负责业务命名和页面级临时样式。

### 2. JSON

这是中间层，也是跨工具的统一格式。

作用是把设计侧的变量抽出来，变成可版本化、可 diff、可编译的数据文件。

这层不应该混入页面逻辑，也不应该写死框架实现细节。

### 3. Style Dictionary

这是编译层。

它负责把统一 token 数据编译成不同输出：

- CSS Variables
- TypeScript 常量
- 主题对象
- 文档展示数据

它的价值在于：设计改一次，代码输出可以统一更新。

### 4. packages/ui

这是消费层。

`packages/ui` 负责：

- 暴露设计 token 的最终出口
- 让组件默认使用 token
- 保证页面层不直接手写散乱样式值

页面和业务层应优先使用这里的结果，而不是跳回原始 token 文件。

## 文件层建议

建议最终至少有下面这几类文件：

```text
packages/ui/
  tokens/
    source/
      figma-tokens.json
    build/
      css-variables.css
      tokens.ts
  src/
    styles/
    components/
```

含义很简单：

- `source/` 放原始 token 数据
- `build/` 放编译结果
- `components/` 真正消费这些结果

## 命名原则

命名必须优先表达语义，不优先表达颜色值。

优先这样：

- `color.brand.primary`
- `color.text.default`
- `spacing.4`
- `radius.md`

不要这样：

- `blue-500`
- `gray-13`
- `rounded-12`

因为 AIVibe OS 追求的是长期可维护，不是眼下图快。

## 修改原则

以后改视觉风格时，优先改 token，不优先逐页改组件。

允许：

- 在 token 层增补语义变量
- 在编译层新增输出格式
- 在组件层消费新 token

不允许：

- 页面里直接写一堆魔法数字
- 组件层偷偷定义新的主色规则
- 同一种视觉含义出现多份名字

## 人和 AI 的分工

AI 可以负责：

- 从 Figma 提取 variables / tokens
- 生成 JSON 草稿
- 生成 Style Dictionary 配置初稿
- 批量替换组件里的硬编码样式值

人必须拍板：

- token 命名体系
- 哪些 token 属于全局，哪些属于主题
- 哪些值值得沉淀，哪些只是一次性页面特例

## 第一阶段最小落地

第一阶段不要贪多，先覆盖这几类：

1. 颜色
2. 字体
3. 间距
4. 圆角
5. 阴影

只要这 5 类跑通，组件库就已经能明显减少重复劳动。

## 验收标准

这条链路算跑通，至少要满足：

- token 可以从 Figma 抽成结构化数据
- token 可以编译成代码层可直接消费的结果
- 基础组件默认使用 token
- 页面层不再反复手写同类视觉值

## 一条铁规矩

**视觉规则先沉到 token，再流向组件和页面；不要让页面反过来定义设计系统。**
