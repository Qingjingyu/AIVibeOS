# AIVibe OS v1 核心模块

## v1 原则

v1 不追求把一切做全，只做最影响效率和质量的底层骨架。

目标是先让一个团队、多个产品，可以按同一套方式稳定推进。

## 模块 1：Workflow

定义统一开发流程：

`Research -> Proposal -> Spec -> Design -> Tasks -> Build -> QA -> Release -> Retro`

作用很直接：让 AI 只执行已经确认的内容，不再自由发挥。

## 模块 2：Knowledge Base

沉淀团队长期复用的内容：

- 开发原则
- Spec / Design / Tasks 模板
- QA 与上线检查清单
- 复盘和踩坑记录

作用是让后续项目越做越快，而不是每次从零开始。

## 模块 3：Design Pipeline

把 Figma 接入开发流程，但不直接一页页还原。

标准路径应是：

`Figma -> design tokens -> 基础组件 -> 页面模块 -> 业务页面`

作用是提高复用率，减少页面级重复劳动。

## 模块 4：Engineering Foundation

为所有产品提供统一的工程底座：

- 前端项目骨架
- 后端服务骨架
- 共享类型与工具
- AI 调用网关
- 日志、监控、测试、发布标准

作用是让项目从一开始就按生产级方式搭建。

## 模块 5：Agent System

把 AI 拆成明确分工，而不是一个万能 agent。

建议至少包括：

- 产品 Agent
- 设计 Agent
- 前端 Agent
- 后端 Agent
- QA Agent
- Review Agent

作用是让 AI 协作更稳定、更可控。

## v1 暂时不做

- 复杂多智能体自动自治
- 过度抽象的平台界面
- 一次性覆盖所有业务场景

v1 的重点是先把流程、底座和复用链路跑通。
