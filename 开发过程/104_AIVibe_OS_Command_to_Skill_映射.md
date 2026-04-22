# AIVibe OS Command to Skill 映射

## 这份文档解决什么问题

有了 Skill 之后，下一个问题马上就会出现：

- 什么时候该触发哪个 Skill
- 一条命令对应一套流程，还是一堆流程
- 多个 Skill 之间谁先谁后

如果这层不明确，Agent 很容易：

- 触发错 Skill
- 漏掉前置 Skill
- 直接跳到实现

这份文档的目标，就是给 AIVibe OS 固定一张“命令 -> Skill” 映射表。

---

## 一、为什么需要 Command 层

Skill 解决的是“怎么做”。

Command 解决的是“现在该调用什么”。

没有 Command 层，Skill 再完整，也很容易变成一堆躺在仓库里的好文件。

---

## 二、AIVibe OS 默认命令集

这一轮先不求很多，先固定 7 条主命令。

### `/spec`

作用：

- 先把问题和需求写清楚

默认触发：

- `idea-refine`
- `spec-driven-development`

当前第一批已落地到：

- `commands/spec.md`
- `skills/idea-refine/SKILL.md`
- `skills/spec-driven-development/SKILL.md`

### `/plan`

作用：

- 把需求拆成小而可验证的任务

默认触发：

- `planning-and-task-breakdown`

当前第一批已落地到：

- `commands/plan.md`
- `skills/planning-and-task-breakdown/SKILL.md`

### `/build`

作用：

- 按薄切片增量实现

默认触发：

- `incremental-implementation`
- `source-driven-development`
- `api-and-interface-design`
- `frontend-ui-engineering`

当前第一批已落地到：

- `commands/build.md`
- `skills/incremental-implementation/SKILL.md`
- `skills/source-driven-development/SKILL.md`
- `skills/api-and-interface-design/SKILL.md`
- `skills/frontend-ui-engineering/SKILL.md`

### `/test`

作用：

- 证明它真的能工作

默认触发：

- `test-driven-development`
- `browser-testing-with-devtools`
- `debugging-and-error-recovery`

当前第一批已落地到：

- `commands/test.md`
- `skills/test-driven-development/SKILL.md`
- `skills/browser-testing-with-devtools/SKILL.md`
- `skills/debugging-and-error-recovery/SKILL.md`

### `/review`

作用：

- 在合并前提高质量和可维护性

默认触发：

- `code-review-and-quality`
- `security-and-hardening`
- `performance-optimization`

当前第一批已落地到：

- `commands/review.md`
- `skills/code-review-and-quality/SKILL.md`
- `skills/security-and-hardening/SKILL.md`
- `skills/performance-optimization/SKILL.md`

### `/code-simplify`

作用：

- 在不改行为的前提下压复杂度

默认触发：

- `code-simplification`

当前第一批已落地到：

- `commands/code-simplify.md`
- `skills/code-simplification/SKILL.md`

### `/ship`

作用：

- 把结果安全送到生产

默认触发：

- `git-workflow-and-versioning`
- `ci-cd-and-automation`
- `documentation-and-adrs`
- `deprecation-and-migration`
- `shipping-and-launch`

当前第一批已落地到：

- `commands/ship.md`
- `skills/git-workflow-and-versioning/SKILL.md`
- `skills/ci-cd-and-automation/SKILL.md`
- `skills/documentation-and-adrs/SKILL.md`
- `skills/deprecation-and-migration/SKILL.md`
- `skills/shipping-and-launch/SKILL.md`

---

## 三、AIVibe OS 推荐的执行顺序

默认主路径：

`/spec -> /plan -> /build -> /test -> /review -> /ship`

不是所有任务都要每次从头跑一遍。

但只要是正式开发任务，至少要能回答：

- 需求在哪
- 计划在哪
- 验证在哪
- 发布证据在哪

---

## 四、命令和资产入口怎么对应

### `/spec`

优先入口：

- `02_Spec模板/01_Research模板.md`
- `02_Spec模板/02_Proposal模板.md`
- `02_Spec模板/01_产品需求Spec模板.md`

### `/plan`

优先入口：

- `02_Spec模板/05_Tasks模板.md`
- `开发过程/103_AIVibe_OS_Skill_标准.md`

### `/build`

优先入口：

- `开发过程/003_AIVibe_OS_标准开发流程.md`
- `开发过程/100_AIVibe_OS_多代理执行模式_本地_后台_云端.md`

### `/test`

优先入口：

- `03_QA与验收/01_通用QA检查清单.md`
- `开发过程/101_AIVibe_OS_Hooks_强制检查规范.md`

### `/review`

优先入口：

- `开发过程/014_AIVibe_OS_完成定义_DoD.md`
- `开发过程/087_AIVibe_OS_工具与依赖总表.md`

### `/ship`

优先入口：

- `03_QA与验收/03_Release模板.md`
- `开发过程/019_AIVibe_OS_发布与回滚模板.md`

---

## 五、命令不是聊天装饰

以后 AIVibe OS 里的命令不应该只是“用户说一句更方便”。

它必须能让系统做 3 件事：

1. 进入正确阶段
2. 触发正确 Skill
3. 拉起正确模板和验证

只要做不到这三件事，这条命令就还不算系统入口。

---

## 六、最容易犯的错

### 1. 一条命令什么都做

最后没有阶段边界。

### 2. 没有前置检查就直接 `/build`

这是最常见的 Demo 路线。

### 3. `/review` 只变成口头建议

它必须有检查点。

### 4. `/ship` 只等于发版命令

它本质上是交付闭环，不只是部署。

---

## 七、AIVibe OS 当前建议

先把这 7 条主命令跑通，不要急着扩成 20 条。

先做少数稳定命令，比做很多没人记得的命令更有价值。

当前第一批已经正式落到：

- `commands/`
- `skills/`

---

## 一句话铁规矩

**在 AIVibe OS 里，Command 不是口号，而是进入正确 Skill、模板和验证链路的正式入口。**
