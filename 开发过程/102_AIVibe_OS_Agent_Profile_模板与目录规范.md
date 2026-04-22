# AIVibe OS Agent Profile 模板与目录规范

## 这份文档解决什么问题

AIVibe OS 以前已经定义过很多角色。

但“角色”和“agent profile”还不是一回事。

角色通常只会写：

- 负责什么
- 大概怎么协作

真正可执行的 agent profile 还必须写清：

- 输入
- 输出
- 工具权限
- 边界
- 完成标准
- 交接方式

这份文档的目标，就是把 AIVibe OS 的 agent 从“概念角色”升级成“可落地 profile”。

---

## 一、一个标准 agent profile 至少要有 8 个字段

### 1. 名称

例如：

- Research Agent
- PM Agent
- Architect Agent
- Frontend Agent
- QA Agent

### 2. 使命

一句话说清它存在的意义。

### 3. 负责范围

写清它管什么，不管什么。

### 4. 输入

它拿到什么材料才能工作：

- spec
- 设计稿
- 代码路径
- 测试结果

### 5. 输出

它必须交回什么：

- 文档
- 代码
- 报告
- PR
- 截图

### 6. 允许工具

它能用什么工具。

### 7. 完成标准

它做到什么程度才算交差。

### 8. 交接格式

它交给下一个 agent 时，必须带哪些信息。

---

## 二、AIVibe OS 推荐的最小模板

```md
# Agent Profile: <Name>

## 使命

## 负责范围

## 不负责什么

## 输入

## 输出

## 允许工具

## 禁止动作

## 完成标准

## 交接格式
```

---

## 三、AIVibe OS 推荐先固化的 8 个 profile

1. Research Agent
2. PM Agent
3. Architect Agent
4. Figma / Design Agent
5. Frontend Agent
6. Backend Agent
7. QA Agent
8. Release / Review Agent

这 8 个已经足够覆盖大多数真实项目。

---

## 四、profile 应该放哪里

以后默认推荐两层：

### 系统层

放通用 profile 模板和规范。

例如：

- `开发过程/`
- `docs/agents/`

### 项目层

放某个项目自己的 agent 配置。

例如：

- `.claude/agents/`
- `.github/agents/`
- `agents/`

一句话：

**系统层负责定义通用 profile，项目层负责实例化。**

---

## 五、profile 和 Top能力 的区别

### Agent profile

解决的是：

- 这个代理是谁
- 它该做什么
- 它怎么交接

### Top能力

解决的是：

- 这件事怎么打
- 这条链路怎么执行
- 这套能力怎么验收

所以：

- profile 是“人”
- Top能力 是“打法”

两者不要混。

---

## 六、最容易犯的错

### 1. 只写使命，不写边界

最后 agent 会互相踩范围。

### 2. 只写输出，不写输入

最后交给它的材料总不够。

### 3. 只写能做什么，不写禁止动作

边界一定会漂。

### 4. 只写角色名，不写交接格式

多代理协作会立刻失真。

---

## 七、AIVibe OS 当前最该补的方向

接下来不是继续发明更多 agent 名字。

而是把现有这些角色补成真正可执行的 profile，并拿真实任务跑一次。

---

## 一句话铁规矩

**AIVibe OS 的 agent 不能只停留在“谁负责什么”，还必须写清“拿什么做、交什么回、做到哪算完”。**
