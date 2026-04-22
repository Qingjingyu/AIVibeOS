# AIVibe OS 多 Agent 任务推进示例

## 场景

目标：实现一个带 AI 摘要能力的 Figma 页面还原功能。

## 推进顺序

1. 产品 Agent
   产出 proposal / spec，明确本次只做页面还原和摘要，不做复杂协作
2. 设计 Agent
   抽 token，做组件映射，拆页面模块
3. 前端 Agent
   用已有组件和 token 拼页面
4. 后端 Agent
   补摘要接口和数据流
5. QA Agent
   按 spec 验证页面、异常流和 AI 输出
6. Review Agent
   看边界、风险、发布门槛
7. 人类拍板
   决定是否发布

## 这个示例要说明什么

- 角色如何接力
- 哪些东西必须先交接
- 为什么不能一个 Agent 全包

## 一句话铁规矩

**多 Agent 推进不是堆角色数量，而是让每一棒都更清楚。**
