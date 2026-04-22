# AIVibe OS 核心链路脚本化方案 v1

## 这份文档解决什么问题

AIVibe OS 现在很多动作已经清楚了，但还主要靠人手执行。

这会带来两个问题：

1. 重复动作很多
2. 每次执行质量不稳定

所以 P2 的核心，不是再写更多规则，而是把最值钱、最重复、最容易出错的动作，优先脚本化。

一句话：

**脚本化不是为了炫技，而是为了把“会做”变成“稳定做”。**

---

## 一、先说原则

这轮脚本化，不追求全自动。

推荐路线是：

### 第一层

先把“收集信息”和“生成证据”脚本化。

### 第二层

再把“串流程”脚本化。

### 第三层

最后才做“一键跑完整链路”。

原因很简单：

如果一上来就追求一键全自动，最后往往会做出一个很脆、很难维护的黑盒。

---

## 二、当前最适合脚本化的 5 条链路

### 1. Figma 取数链路

动作包括：

- 拉 design context
- 拉 screenshot
- 拉 metadata
- 收集素材地址

为什么优先：

- 重复度高
- 输入相对标准
- 很适合形成固定产物

### 2. 页面截图验收链路

动作包括：

- 打开本地页面
- 固定窗口尺寸
- 自动截图
- 输出截图路径

为什么优先：

- 现在已经真实用过
- 是高频动作
- 直接服务于验收证据

### 3. 项目 Phase 证据收集链路

动作包括：

- 收集 Proposal / Spec / Design / QA / Release 文件
- 按阶段输出看板
- 检查缺项

为什么优先：

- 可以直接把“证据化”落下去

### 4. 工具登记链路

动作包括：

- 扫描已知 skill / MCP / Top能力
- 生成台账草稿
- 标记未补字段

为什么优先：

- 现在我们已经开始有这类信息，但更新全靠手动

### 5. 实战回灌链路

动作包括：

- 生成回灌记录草稿
- 提示需要补的证据
- 提示应挂载到哪些入口

为什么优先：

- 这是 AIVibe 自我进化的关键链路

---

## 三、推荐先做的 3 个脚本

这轮最推荐先做下面 3 个，不要贪多。

### 1. `capture-page`

用途：

- 统一做本地页面截图

输入：

- URL
- 宽高
- 输出路径

输出：

- 截图文件

价值：

- 直接服务页面验收

当前状态：

- 已落地脚本：`scripts/qa/capture-page.sh`
- 已验证可对公开页面输出截图

### 2. `phase-check`

用途：

- 检查一个项目当前 Phase 证据缺什么

输入：

- 项目文档路径

输出：

- 缺失项列表
- 当前阶段判断

价值：

- 直接把 `085` 证据化规范落成动作

当前状态：

- 已落地脚本：`scripts/governance/phase-check.sh`
- 已验证可对目录做基础缺项检查
- 已支持输出检查报告文件
- 已支持 `project` 扫描模式
- 已收窄为“项目文档资产”扫描，不再默认混入杂项目录
- 默认会回写到仓库内固定目录 `治理输出/phase-check/`

### 3. `tool-registry-draft`

用途：

- 扫描已知入口，生成工具总表草稿

输入：

- 仓库路径

输出：

- 待补齐的工具登记草稿

价值：

- 直接减轻手工维护成本

当前状态：

- 已落地脚本：`scripts/governance/tool-registry-draft.sh`
- 已支持输出工具台账草稿到终端或文件
- 默认只扫描正式资产，可选 `all` 模式
- 已支持 Markdown 表格输出
- 已支持自动补一部分状态和说明
- `formal` 模式已跳过 Top能力 内重复 Skill 条目
- 默认会回写到仓库内固定目录 `治理输出/tool-registry/`

---

## 四、脚本目录建议

以后如果正式开始加脚本，建议统一放在：

```text
scripts/
  figma/
  qa/
  governance/
```

### `scripts/figma/`

放 Figma 取数、素材收集、页面截图相关脚本。

### `scripts/qa/`

放截图、验收、差异收集相关脚本。

### `scripts/governance/`

放 Phase 检查、回灌草稿、工具台账生成等脚本。

当前已存在：

- `scripts/qa/capture-page.sh`
- `scripts/governance/phase-check.sh`
- `scripts/governance/tool-registry-draft.sh`
- `scripts/governance/update-bootstrap-board.sh`
- `scripts/governance/run-aivibe-closeout.sh`

其中最新补上的治理闭环是：

- `update-bootstrap-board`
  - 现在已经可以稳定生成自举看板快照
  - 默认会回写到 `治理输出/bootstrap-board/`
  - 会同步更新 `latest.md`
  - 这意味着自举状态第一次从“文档描述”变成了“固定产物”
- `run-aivibe-closeout`
  - 现在已经把阶段检查、工具台账、自举看板串成固定收尾动作
  - 默认会回写到 `治理输出/closeout/`
  - 会同步生成 `latest.md`
  - 这意味着“每轮结束要做什么”第一次从口头约定变成了稳定动作

---

## 五、脚本化的完成标准

以后一个脚本算完成，不是“能跑一次”。

至少要满足：

1. 输入参数清楚
2. 输出结果固定
3. 出错时能看懂
4. README 里有用法
5. 至少在一次真实任务里跑过

以 `update-bootstrap-board` 为例，这 5 条现在已经满足：

1. 直接执行 `bash ./scripts/governance/update-bootstrap-board.sh`
2. 固定输出到 `治理输出/bootstrap-board/`
3. 出错时能直接看到 shell 报错
4. `scripts/README.md` 已补用法
5. 已在本仓真实自优化任务中跑通

以 `run-aivibe-closeout` 为例，也已经满足：

1. 直接执行 `bash ./scripts/governance/run-aivibe-closeout.sh`
2. 固定输出到 `治理输出/closeout/`
3. 出错时会明确暴露是哪一条子脚本失败
4. `scripts/README.md` 已补用法
5. 已在本仓真实自优化任务中跑通

---

## 六、这轮为什么先不直接写一堆脚本

因为现在更重要的是先把：

- 哪些链路值得脚本化
- 脚本该放哪
- 每个脚本的成功标准是什么

先定清楚。

否则很容易出现：

- 写了很多小脚本
- 命名混乱
- 用法不统一
- 后面没人接得住

---

## 七、下一步执行建议

如果下一轮进入真正脚本实现，建议按这个顺序做：

1. 先做 `capture-page`
2. 再做 `phase-check`
3. 评估 `tool-registry-draft` 是否要补更多字段来源
4. 再决定要不要做一键串联

---

## 八、一句话铁规矩

**脚本化优先做高频、标准、可验收的动作，不先做大而全黑盒。**
