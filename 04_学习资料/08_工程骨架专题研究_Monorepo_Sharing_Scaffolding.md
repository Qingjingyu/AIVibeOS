# 工程骨架专题研究：Monorepo / Sharing / Scaffolding

## 研究目标

这一轮研究聚焦三个问题：

1. 多包仓库最稳的基础结构应该怎么搭
2. 共享包应该怎么暴露，避免业务代码互相污染
3. 项目模板和脚手架应该怎么生成，而不是手工复制目录

## 结论先说

官方资料看下来，比较稳的路线不是“做一个超复杂平台”，而是先把下面三层做好：

- **Workspace 结构**：把应用和内部包分清楚
- **Internal Packages**：把共享能力做成工作区内部包
- **Software Templates / Scaffolding**：把起项目过程标准化

## 关键信息 1：Monorepo 的核心不是把代码放一起，而是边界清楚

Turborepo 官方强调，workspace 的每个 package 都应像一个小项目，有自己的 `package.json`、源码和工具配置。  
这说明 AIVibe OS 的 `apps/*` 和 `packages/*` 结构是对的，关键是继续把依赖方向和职责边界定死。  
来源：

- Turborepo workspace structure：<https://turborepo.com/repo/docs/handbook/workspaces>
- Turborepo internal packages：<https://turborepo.com/docs/core-concepts/internal-packages>

## 关键信息 2：共享层应该通过 Internal Package 暴露

Turborepo 和 pnpm 都默认把内部共享能力当作 workspace 包来管理，而不是靠复制文件或路径别名乱连。  
这意味着 AIVibe OS 里 `packages/ui`、`packages/shared`、`packages/ai` 的方向是正确的。  
来源：

- Turborepo internal packages：<https://turborepo.com/docs/core-concepts/internal-packages>
- pnpm workspaces：<https://pnpm.io/workspaces>

## 关键信息 3：模板系统的价值是“少手工”，不是“多页面”

Backstage 官方把 software templates 讲得很直白：模板本质上是带输入参数和执行步骤的代码生成入口。  
这说明 AIVibe OS 后面的项目模板，不应只是“目录说明文档”，而应逐步走向可生成、可 dry-run、可测试的模板系统。  
来源：

- Backstage software templates overview：<https://backstage.io/docs/features/software-templates>
- Backstage adding templates：<https://backstage.io/docs/features/software-templates/adding-templates>

## 对 AIVibe OS 的直接启发

第一，`apps/*` 和 `packages/*` 的边界要进一步写成依赖规则。  
第二，`packages/shared` 不能成为“什么都往里塞”的大垃圾桶。  
第三，标准项目模板应该逐步进入“脚手架生成”阶段，而不是停在 README 和清单阶段。  
第四，模板系统后面可以参考 Backstage 的“参数 + 步骤 + dry run”思路。

## 这轮研究后的建议动作

1. 补 `AIVibe OS Shared Layer 边界规范`
2. 补 `AIVibe OS Package 依赖规则`
3. 补 `AIVibe OS 项目模板生成策略`

## 一句话总结

**工程骨架最值钱的不是目录好看，而是共享能力怎么暴露、依赖怎么流、起项目怎么自动化。**
