# AIVibe OS Pack 标准

## 这份文档解决什么问题

AIVibe OS 现在已经有：

- commands
- skills
- agents
- Top能力

但还缺一个更底层、偏长期运行的组织单元。

这个单元不是“怎么做某件事”，而是：

**为长期运行的数字员工提供某一类基础能力。**

这就是 `Pack`。

---

## 一、什么是 Pack

在 AIVibe OS 里，Pack 不是普通 skill。

Skill 更像“工作流”。

Pack 更像“基础设施能力块”。

例如：

- context
- audit
- schedule
- token usage
- skill router

一句话：

**Skill 解决一次任务怎么做，Pack 解决长期系统靠什么稳定运行。**

---

## 二、Pack 和其他资产的区别

### Pack

解决的是：

- 这个长期能力块负责什么
- 它给谁提供能力
- 它输出什么结构化结果

### Skill

解决的是：

- 这次任务怎么执行

### Bundle

解决的是：

- 多个 Pack 怎么组合成一种工种

### Orchestrator

解决的是：

- 这些 Bundle 怎么按节奏一起运行

---

## 三、一个标准 Pack 至少要有 6 个字段

1. 名称
2. 解决什么长期问题
3. 输入
4. 输出
5. 生命周期
6. 验证方式

---

## 四、推荐目录结构

```text
aivibe/
  packs/
    pack-name/
      README.md
      pack.aivibe.json
```

如果还没有正式 manifest，至少要先有 `README.md`。

---

## 五、AIVibe OS 第一批基础 Pack

优先定义这 4 个：

1. `context-pack`
2. `audit-pack`
3. `schedule-pack`
4. `skill-router-pack`

它们不是业务功能，而是系统稳定运行的基础设施。

---

## 六、Pack 的完成定义

一个 Pack 算完成，不是“名字起好了”。

至少要满足：

- 角色清楚
- 输入输出清楚
- 能挂进实例配置
- 有验证方式

---

## 七、最容易犯的错

### 1. 把 Skill 当 Pack

会让组织层和执行层混掉。

### 2. Pack 太业务化

Pack 应该先偏基础设施，不先长成业务功能集合。

### 3. 没有结构化输出

Pack 的价值就在于它能产出系统可消费的结果。

---

## 一句话铁规矩

**AIVibe OS 里的 Pack，不是单次工作流，而是支撑数字员工长期运行的基础能力块。**
