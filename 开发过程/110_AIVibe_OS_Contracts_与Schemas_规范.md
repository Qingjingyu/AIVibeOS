# AIVibe OS Contracts 与 Schemas 规范

## 这份文档解决什么问题

如果长期运行的数字员工没有统一契约，最后一定会出现：

- 输出格式不稳定
- 治理结果不可读
- 审计和回放对不上

所以 AIVibe OS 需要一组最低限度的 Contracts / Schemas。

---

## 一、优先定义的 3 类契约

1. `decision-log`
2. `trace-span`
3. `token-usage-report`

这三类最基础，也最容易给系统带来结构化收益。

---

## 二、为什么先做这 3 类

### `decision-log`

记录关键判断，不让重要决策只留在对话里。

### `trace-span`

记录阶段、动作、结果，方便回放和定位。

### `token-usage-report`

记录成本和使用情况，方便后续优化。

---

## 三、一句话铁规矩

**没有结构化契约，长期运行的数字员工系统就没有可审计性。**
