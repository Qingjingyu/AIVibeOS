# AIVibe OS AI Runtime 模板入口

## 这份文档解决什么问题

AI Runtime 这一组文档现在已经不少了。

问题不是没有内容，而是第一次接手的人容易分不清：

- 哪份是总纲
- 哪份是规范
- 哪份是真模板
- 哪份是上线前必须补的

这份入口文档，就是专门用来说清楚：

**如果你要在项目里接 AI 功能，先看哪几份，按什么顺序看。**

---

## 一、先说最短路径

如果你时间很少，先按这个顺序读：

1. [015_AIVibe_OS_AI_Runtime_目录设计.md](./015_AIVibe_OS_AI_Runtime_目录设计.md)
2. [016_AIVibe_OS_AI_Task_封装规范.md](./016_AIVibe_OS_AI_Task_封装规范.md)
3. [022_AIVibe_OS_AI_Task_模板.md](./022_AIVibe_OS_AI_Task_模板.md)
4. [017_AIVibe_OS_AI_Evals_评测规范.md](./017_AIVibe_OS_AI_Evals_评测规范.md)
5. [023_AIVibe_OS_AI_Evals_模板.md](./023_AIVibe_OS_AI_Evals_模板.md)

看完这 5 份，已经足够支撑你做一个最小 AI 能力。

---

## 二、按角色理解这一组文档

### 1. 总纲层

先看：

- [015_AIVibe_OS_AI_Runtime_目录设计.md](./015_AIVibe_OS_AI_Runtime_目录设计.md)

它解决的是：

- `packages/ai` 应该怎么长
- provider、tasks、runtime、logs、evals 分别放哪

如果这一层不先看，后面很容易把 AI 代码写散。

### 2. Task 规范层

先看：

- [016_AIVibe_OS_AI_Task_封装规范.md](./016_AIVibe_OS_AI_Task_封装规范.md)

它解决的是：

- 一个 AI Task 应该长什么样
- Task 的输入输出、失败处理、调用策略怎么定

### 3. Task 模板层

直接用：

- [022_AIVibe_OS_AI_Task_模板.md](./022_AIVibe_OS_AI_Task_模板.md)

它不是解释概念，而是给你直接填空的。

### 4. Evals 规范层

先看：

- [017_AIVibe_OS_AI_Evals_评测规范.md](./017_AIVibe_OS_AI_Evals_评测规范.md)

它解决的是：

- 一个 AI 能力最少要怎么评
- 什么情况下必须重评

### 5. Evals 模板层

直接用：

- [023_AIVibe_OS_AI_Evals_模板.md](./023_AIVibe_OS_AI_Evals_模板.md)

### 6. 配套规则层

按需要补看：

- [031_AIVibe_OS_AI_日志字段模板.md](./031_AIVibe_OS_AI_日志字段模板.md)
- [032_AIVibe_OS_Prompt_版本模板.md](./032_AIVibe_OS_Prompt_版本模板.md)
- [033_AIVibe_OS_Provider_适配规范.md](./033_AIVibe_OS_Provider_适配规范.md)
- [041_AIVibe_OS_AI_降级策略模板.md](./041_AIVibe_OS_AI_降级策略模板.md)
- [042_AIVibe_OS_Runtime_回放记录模板.md](./042_AIVibe_OS_Runtime_回放记录模板.md)

---

## 三、按任务类型怎么用

### 情况 1：第一次给项目接 AI 能力

按这个顺序：

1. `015`
2. `016`
3. `022`
4. `017`
5. `023`

目标是先把最小 Task 和最小评测做出来。

### 情况 2：已经有 AI 功能，要补日志或降级

优先看：

- `031`
- `033`
- `041`
- `042`

### 情况 3：准备把 AI 能力带进生产

最少要补齐：

- `022` Task 模板
- `023` Evals 模板
- `031` 日志字段
- `041` 降级策略

---

## 四、这组文档里，谁是主模板

这一组真正拿来填空的主模板，只有两份：

1. [022_AIVibe_OS_AI_Task_模板.md](./022_AIVibe_OS_AI_Task_模板.md)
2. [023_AIVibe_OS_AI_Evals_模板.md](./023_AIVibe_OS_AI_Evals_模板.md)

其它大多数是规范、设计、配套规则。

这点必须分清。

不然很容易看了很多文档，最后却不知道到底该填哪份。

---

## 五、最容易犯的错

### 1. 跳过 `015`

直接写 Task，最后目录和边界容易全乱。

### 2. 只写 Task，不写 Evals

这样 AI 功能上线后根本不知道有没有退化。

### 3. 只调通 provider，就以为 AI Runtime 完成了

其实那只是“能调模型”，不是“能进系统”。

### 4. 日志、Prompt、降级放到最后再想

最后通常就来不及补完整。

---

## 六、一句话铁规矩

**AI Runtime 先看总纲，再看规范，再填模板；先把 Task 和 Evals 立住，再谈接更多模型。**
