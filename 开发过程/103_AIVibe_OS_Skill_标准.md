# AIVibe OS Skill 标准

## 这份文档解决什么问题

AIVibe OS 现在已经有：

- 母文档
- Top能力
- Agent 角色
- 脚本
- 模板

但还缺一层真正的“技能标准”。

结果就是：

- 有些东西像能力包，但不能稳定触发
- 有些东西像模板，但不能独立执行
- 有些东西像角色说明，但不知道该调用哪一套方法

这份文档的目标，就是把 `Skill` 从泛泛概念，变成 AIVibe OS 里的正式资产类型。

一句话：

**Skill 是把一套稳定工作流封装给 Agent 直接执行的最小单位。**

---

## 一、什么是 Skill

在 AIVibe OS 里，Skill 不是普通文档。

它必须同时满足：

- 解决一个明确问题
- 有稳定输入输出
- 有固定执行步骤
- 有验证方式
- 有适用边界

如果只有经验，没有执行结构，它还不算 Skill。

---

## 二、Skill 和其他资产的区别

### Skill

解决的是：

- 这件事怎么做
- 遇到这个意图时该触发什么流程

### Agent Profile

解决的是：

- 谁来做
- 允许用什么工具
- 交什么结果

### Top能力

解决的是：

- 一整套高强度打法怎么独立打包

### 模板

解决的是：

- 某种输出长什么样

所以：

- Skill 是“动作包”
- Agent Profile 是“角色卡”
- Top能力 是“能力产品”
- 模板 是“输出骨架”

---

## 三、一个 AIVibe Skill 的最低要求

任何一个正式 Skill，至少要有下面 7 个部分。

1. 解决什么问题
2. 什么时候用
3. 输入是什么
4. 步骤怎么走
5. 怎么判断做完
6. 常见偷懒借口是什么
7. 红线和禁用场景是什么

少任何一项，Skill 都容易虚。

---

## 四、Skill 的默认目录结构

以后如果要把一个 Skill 做成正式件，默认推荐这样放：

```text
skills/
  skill-name/
    SKILL.md
    examples/
    templates/
    doc/
```

### `SKILL.md`

放这套 Skill 的主说明。

### `examples/`

放真实使用例子。

### `templates/`

放这个 Skill 常用输出模板。

### `doc/`

放资源、限制、后续自动化方向。

---

## 五、Skill 的成熟度分级

### Level 1：草案

- 有问题定义
- 有步骤
- 没有真实验证

### Level 2：可试用

- 有真实案例
- 有最小验证
- 还没稳定复用

### Level 3：正式

- 多次真实验证
- 可交接
- 可独立分发
- 已有固定入口

只有 Level 3，才适合进 `Top能力`。

---

## 六、AIVibe OS 当前最值得优先做成 Skill 的方向

1. `spec-driven-development`
2. `planning-and-task-breakdown`
3. `incremental-implementation`
4. `test-driven-development`
5. `browser-testing-with-devtools`
6. `code-review-and-quality`
7. `shipping-and-launch`
8. `figma-to-code`

原因很简单：

这些是最常复用、最容易偷懒、最直接影响交付质量的链路。

---

## 七、Skill 的完成定义

一个 Skill 算完成，不是“文档写完了”。

至少要满足：

- Agent 能直接按它执行
- 同事能读懂它解决什么问题
- 有真实例子
- 有验证标准
- 有边界说明

---

## 八、最容易犯的错

### 1. 把任何好文档都叫 Skill

这样 Skill 会失真。

### 2. 只有步骤，没有验证

AI 很容易跳步。

### 3. 没有边界

最后 Skill 会被拿去处理不适合的任务。

### 4. 没有偷懒借口清单

AI 和人都会默认走最短路径。

---

## 一句话铁规矩

**在 AIVibe OS 里，Skill 不是知识点，而是一套带输入、步骤、验证和边界的可执行工作流。**
