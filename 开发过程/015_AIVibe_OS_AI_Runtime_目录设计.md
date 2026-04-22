# AIVibe OS AI Runtime 目录设计

## 目标

这份文档回答一个问题：

`packages/ai` 到底应该怎么组织，才能让 AI 能力可替换、可追踪、可评测，而不是散落在业务代码里。

## 总原则

AI Runtime 不是“调模型的工具包”，而是业务和模型之间的统一中间层。

它要解决的是：

- 模型厂商差异
- 提示词版本管理
- 任务级能力封装
- 日志和成本追踪
- 评测和回放
- 重试和降级

## 推荐目录

```text
packages/ai/
  providers/
  prompts/
  tasks/
  schemas/
  runtime/
  logs/
  evals/
  fixtures/
```

## 每个目录负责什么

### providers/

放不同模型厂商的适配层。

例如：

- OpenAI
- Anthropic
- Gemini
- 本地模型或代理层

职责只有一个：把“外部模型接口差异”封在这里。

业务层和任务层不应该直接接触厂商 SDK。

### prompts/

放提示词模板和版本。

建议按能力拆分，不按模型拆分。

例如：

- `summarize/`
- `extract/`
- `rewrite/`
- `classify/`

每份提示词至少要能追踪版本，不允许线上逻辑全靠随手拼字符串。

### tasks/

这是最关键的一层。

这里放“业务可调用的 AI 能力”。

例如：

- `generatePageSummary`
- `extractDesignTokens`
- `classifySupportIntent`

任务层负责：

- 选 prompt
- 选 schema
- 调 runtime
- 返回稳定结构

### schemas/

放输入输出结构定义。

作用是让每个任务的入参与出参稳定，不要让业务层直接吃模型原始文本。

### runtime/

放统一运行逻辑：

- 调用入口
- 超时控制
- 重试
- 降级
- 缓存
- provider 选择

这里是整个 AI Runtime 的调度中心。

### logs/

放日志结构、追踪字段、成本记录规则。

这里不一定存所有日志文件，但要定义清楚：

- 记录哪些字段
- 记录到哪里
- 怎么关联请求和任务

### evals/

放评测样本、规则、回放脚本和结果定义。

### fixtures/

放固定样本和测试输入。

用于：

- 本地调试
- 回归验证
- 评测复现

## 调用链路

标准调用顺序应是：

`业务代码 -> tasks -> runtime -> providers`

而不是：

`业务代码 -> provider SDK`

## 目录边界规则

- `providers/` 不懂业务
- `prompts/` 不负责调用
- `tasks/` 不直接写厂商细节
- `runtime/` 不承担具体业务语义
- `evals/` 不直接混进线上调用逻辑

## 第一阶段最小落地

第一版 `packages/ai` 先至少具备：

1. 一个统一调用入口
2. 两个 provider 适配位
3. 一组 prompt 版本目录
4. 两到三个任务级封装示例
5. 一份日志字段标准
6. 一套最小评测样本

## 一句话铁规矩

**业务只调用任务，不直接调用模型；模型差异和运行复杂度全部收口进 AI Runtime。**
