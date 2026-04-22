# AIVibe OS Figma 系统模板与 Top能力 边界入口

## 这份文档解决什么问题

现在 AIVibe 里和 Figma 相关的东西已经有两层了：

### 系统层

在 `开发过程/` 里，有：

- 规范
- 通用模板
- 记录模板

### 能力层

在 `Top能力/Figmatocode/` 里，有：

- 完整打法
- Agent 可执行能力
- 验收清单
- 私有示例和私有记录模板

如果不把这两层边界说清楚，后面就会反复出现一个问题：

- 有人拿系统模板去替代能力包
- 有人拿能力包去覆盖系统模板
- 最后谁是通用件、谁是强化件，越来越不清楚

一句话：

**系统模板负责通用底座，Top能力 负责高强度打法，不是一回事。**

---

## 一、先说最简单的判断法

以后先用这条判断：

### 如果你是在搭系统、沉模板、做通用规范

看 `开发过程/` 这层。

### 如果你是在做真实页面高保真还原、要快速拿结果、要给 Agent 直接执行

看 `Top能力/Figmatocode/` 这层。

不要混。

---

## 二、系统层到底负责什么

系统层的 Figma 文档，解决的是通用问题。

比如：

- 组件映射规则怎么定
- tokens 怎么编
- 页面模块怎么记
- 实验记录怎么留

当前主要文件有：

- [005_AIVibe_OS_Figma_到代码流水线.md](./005_AIVibe_OS_Figma_到代码流水线.md)
- [009_AIVibe_OS_Figma_组件映射规范.md](./009_AIVibe_OS_Figma_组件映射规范.md)
- [010_AIVibe_OS_Tokens_编译链路.md](./010_AIVibe_OS_Tokens_编译链路.md)
- [024_AIVibe_OS_Figma_组件映射记录模板.md](./024_AIVibe_OS_Figma_组件映射记录模板.md)
- [029_AIVibe_OS_页面模块清单模板.md](./029_AIVibe_OS_页面模块清单模板.md)
- [030_AIVibe_OS_设计到代码实验记录模板.md](./030_AIVibe_OS_设计到代码实验记录模板.md)

这一层的目标是：

**让所有项目共享一套通用语言。**

---

## 三、Top能力 层到底负责什么

`Top能力/Figmatocode/` 解决的是：

- 这次就要把页面还原出来
- 这次就要给 Agent 一套能执行的打法
- 这次就要拿原素材、原参数、原结构做高保真还原

它更像一套“作战包”。

当前主要文件有：

- [Top能力/Figmatocode/README.md](../Top能力/Figmatocode/README.md)
- [Top能力/Figmatocode/SKILL.md](../Top能力/Figmatocode/SKILL.md)
- [Top能力/Figmatocode/core/01_Figma_to_Code_完整SOP.md](../Top能力/Figmatocode/core/01_Figma_to_Code_完整SOP.md)
- [Top能力/Figmatocode/templates/页面验收清单模板.md](../Top能力/Figmatocode/templates/页面验收清单模板.md)
- [Top能力/Figmatocode/extensions/组件映射记录模板.md](../Top能力/Figmatocode/extensions/组件映射记录模板.md)

这一层的目标是：

**让真实页面任务更快、更稳、更像样。**

---

## 四、什么时候看系统模板，什么时候直接上 Top能力

### 场景 1：你在搭新项目的 Figma 工作流

先看系统层。

因为你现在要的是：

- 通用规范
- 目录和边界
- 系统级模板

### 场景 2：你接到一个真实页面，要高保真还原

直接上 `Top能力/Figmatocode/`。

因为你现在要的是：

- 现成打法
- Agent 可执行指令
- 验收清单
- 真实示例

### 场景 3：你做完一轮页面，想把经验沉回系统

两层都要看。

顺序是：

1. 先在能力层总结怎么打
2. 再判断哪些值得回写到系统层

---

## 五、最容易混的几个点

### 1. 组件映射记录模板

系统层有：

- [024_AIVibe_OS_Figma_组件映射记录模板.md](./024_AIVibe_OS_Figma_组件映射记录模板.md)

能力层有：

- [Top能力/Figmatocode/extensions/组件映射记录模板.md](../Top能力/Figmatocode/extensions/组件映射记录模板.md)

区别是：

- 系统层版本更通用
- 能力层版本更贴近 Figmatocode 自己的打法

不要强行只留一个。

### 2. 验收清单

系统层会有通用 QA、实验记录。

能力层会有更针对页面还原的验收清单。

区别是：

- 系统层偏总规则
- 能力层偏具体页面验收

### 3. SOP

系统层讲的是主流程和底层方法。

能力层讲的是可以直接复制的作战流程。

---

## 六、推荐使用顺序

如果你是第一次做 Figma 到代码，最推荐这样走：

1. 先看 [005_AIVibe_OS_Figma_到代码流水线.md](./005_AIVibe_OS_Figma_到代码流水线.md)
2. 再看 [009_AIVibe_OS_Figma_组件映射规范.md](./009_AIVibe_OS_Figma_组件映射规范.md)
3. 然后直接进入 [Top能力/Figmatocode/README.md](../Top能力/Figmatocode/README.md)
4. 真实任务做完后，再回系统层补记录和规则

这样最稳。

---

## 七、最不该做的事

### 1. 用系统模板硬替代能力包

结果就是理论够了，落地不够快。

### 2. 用能力包反过来覆盖系统规则

结果就是系统边界会慢慢失控。

### 3. 发现两边都像，就删掉其中一个

先看职责，不要只看标题像不像。

---

## 八、一句话铁规矩

**系统层负责通用底座，Top能力 负责高强度执行；前者是系统，后者是作战包。**
