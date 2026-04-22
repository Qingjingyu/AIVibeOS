# AIVibe OS 工程骨架专题吸收决策

## 这轮研究要吸收什么

基于 Turborepo、pnpm、Backstage 官方资料，这轮专题后 AIVibe OS 先吸收下面 4 个决策。

## 决策 1：Shared Layer 单独立规矩

`packages/shared` 不再只视为“共用工具目录”。

以后默认只允许放：

- 共享类型
- 常量
- 错误码
- 纯工具函数

不允许把业务逻辑、页面逻辑、模型调用塞进去。

## 决策 2：依赖方向必须单向

默认依赖方向定为：

- `apps/*` 可以依赖 `packages/*`
- `packages/ui` 可以依赖 `packages/shared`
- `packages/ai` 可以依赖 `packages/shared`
- `packages/shared` 不能反向依赖业务包

这样才能避免共享层被业务反绑死。

## 决策 3：项目模板进入脚手架阶段

从现在开始，AIVibe OS 的“标准项目模板”不该只靠文档说明。

下一阶段应逐步进入：

- 参数化模板
- 干跑验证
- 最小生成结果

## 决策 4：起项目优先靠模板，不靠复制旧仓

以后不再鼓励直接复制老项目起新项目。

标准做法应转向：

- 模板生成
- 填参数
- 补业务差异

## AIVibe OS 下一步任务

基于这轮吸收，下一步应新增：

1. `061_AIVibe_OS_Shared_Layer_边界规范.md`
2. `062_AIVibe_OS_Package_依赖规则.md`
3. `063_AIVibe_OS_项目模板生成策略.md`

## 一句话原则

**工程骨架的长期价值，不在目录，而在边界、依赖和生成方式。**
