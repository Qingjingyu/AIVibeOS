# AIVibe OS Orchestrator 标准

## 这份文档解决什么问题

有了 Skill、Pack、Bundle 之后，还要回答：

**它们怎么按时间和状态一起运行。**

这就是 `Orchestrator`。

---

## 一、什么是 Orchestrator

Orchestrator 不是一个具体 skill，也不是某个单独 agent。

它负责：

- 何时触发
- 何时切换
- 何时暂停
- 何时升级到 office-hours
- 何时要求验证和收尾

---

## 二、AIVibe OS 里 Orchestrator 的最低职责

1. 阶段切换
2. 失败升级
3. 证据收集
4. 收尾触发

---

## 三、最小判断

一个 Orchestrator 至少要能回答：

- 当前任务在哪个阶段
- 下一步应该触发哪个 command / skill
- 什么时候该停下来升级
- 什么时候可以进入 release gate

---

## 四、一句话铁规矩

**Orchestrator 不负责变聪明，它负责让系统别乱跑。**
