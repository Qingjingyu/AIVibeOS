# AIVibe OS 操作手册 v1

## 这份手册解决什么问题

这不是解释 AIVibe OS 是什么，而是告诉你：

**拿到一个真实项目后，第一天怎么用它开工。**

如果你只想走最短路径，不想看完整手册，先看：

- [083_AIVibe_OS_新项目最小启动路径.md](./083_AIVibe_OS_新项目最小启动路径.md)

## 使用前提

开始前先确认三件事：

1. 这次要做的目标是什么
2. 这次只做什么 MVP
3. 这次有没有 Figma、AI 功能、发布需求

如果这三件事都说不清，先不要开写。

## 新项目启动顺序

按这个顺序走：

1. 看 [000_Roadmap.md](./000_Roadmap.md)
2. 看 [003_AIVibe_OS_标准开发流程.md](./003_AIVibe_OS_标准开发流程.md)
3. 用 [013_AIVibe_OS_标准项目仓模板.md](./013_AIVibe_OS_标准项目仓模板.md) 定项目骨架
4. 用 `Research / Proposal / Spec / Design / Tasks` 模板把需求写清楚
5. 再进入实现

## 什么时候看哪些文件

### 要起项目

先看：

- [013_AIVibe_OS_标准项目仓模板.md](./013_AIVibe_OS_标准项目仓模板.md)
- [026_AIVibe_OS_Env_模板规范.md](./026_AIVibe_OS_Env_模板规范.md)
- [027_AIVibe_OS_Monorepo_初始化清单.md](./027_AIVibe_OS_Monorepo_初始化清单.md)
- [047_AIVibe_OS_最小README_启动模板.md](./047_AIVibe_OS_最小README_启动模板.md)

### 要做 Figma 到代码

先看：

- [005_AIVibe_OS_Figma_到代码流水线.md](./005_AIVibe_OS_Figma_到代码流水线.md)
- [009_AIVibe_OS_Figma_组件映射规范.md](./009_AIVibe_OS_Figma_组件映射规范.md)
- [010_AIVibe_OS_Tokens_编译链路.md](./010_AIVibe_OS_Tokens_编译链路.md)
- [066_AIVibe_OS_真实Figma闭环执行计划.md](./066_AIVibe_OS_真实Figma闭环执行计划.md)

### 要接 AI 功能

先看：

- [015_AIVibe_OS_AI_Runtime_目录设计.md](./015_AIVibe_OS_AI_Runtime_目录设计.md)
- [016_AIVibe_OS_AI_Task_封装规范.md](./016_AIVibe_OS_AI_Task_封装规范.md)
- [017_AIVibe_OS_AI_Evals_评测规范.md](./017_AIVibe_OS_AI_Evals_评测规范.md)
- [054_AIVibe_OS_HITL_中断与恢复规范.md](./054_AIVibe_OS_HITL_中断与恢复规范.md)

### 要准备发布

先看：

- [014_AIVibe_OS_完成定义_DoD.md](./014_AIVibe_OS_完成定义_DoD.md)
- [018_AIVibe_OS_QA_执行模板.md](./018_AIVibe_OS_QA_执行模板.md)
- [019_AIVibe_OS_发布与回滚模板.md](./019_AIVibe_OS_发布与回滚模板.md)

## 一次真实项目的最小走法

最小闭环就是：

1. 写 proposal
2. 写 spec
3. 写 design
4. 拆 tasks
5. 建项目骨架
6. 实现
7. QA
8. 发布或演练
9. 复盘

不要跳步，尤其不要跳过 spec、QA、回滚方案。

## 什么时候要补规则

下面这些情况出现时，要把经验回收到 AIVibe OS：

- 模板不够用
- 角色交接卡住
- Figma 映射反复踩坑
- AI Task 输出不稳
- 发布或回滚时暴露新问题

## 最后一句

**把 AIVibe OS 当操作系统，不要当资料库。先按它走一遍，再决定哪里该改。**
