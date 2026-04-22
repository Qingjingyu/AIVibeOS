# AIVibe OS Bundle 标准

## 这份文档解决什么问题

有了 Pack 之后，还需要回答一个问题：

**多个 Pack 怎么组合成一种“工种”。**

这就是 `Bundle` 的作用。

---

## 一、什么是 Bundle

Bundle 是 Pack 的组合。

它不是单个能力块，也不是单个任务流程。

它更像：

- 一个数字员工的工具腰带
- 一类工种的基础配置

例如：

- Research Bundle
- Release Bundle

---

## 二、Bundle 负责什么

Bundle 解决的是：

- 哪些 Pack 应该放在一起
- 这套组合更适合哪类角色
- 它默认服务哪类任务

---

## 三、推荐目录结构

```text
aivibe/
  bundles/
    bundle-name/
      README.md
      bundle.aivibe.json
```

---

## 四、AIVibe OS 第一批建议 Bundle

1. `research-bundle`
2. `release-bundle`

先做少量高价值工种组合，不要一上来造 20 套。

---

## 五、Bundle 和 Agent Profile 的区别

### Bundle

是能力组合层。

### Agent Profile

是角色定义层。

一句话：

- Bundle 是“带什么工具包”
- Agent Profile 是“谁来干、怎么交接”

---

## 六、一句话铁规矩

**Bundle 负责把 Pack 组合成稳定工种，不直接替代 Skill，也不替代 Agent Profile。**
