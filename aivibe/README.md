# aivibe/

这里放 AIVibe OS 的项目实例层骨架。

它不是新系统，而是把：

- packs
- bundles
- contracts
- `aivibe.json`

放在一个可实例化的位置。

## 当前第一批

- `aivibe.json`
- `contracts/`
- `packs/context-pack`
- `packs/audit-pack`
- `packs/schedule-pack`
- `packs/skill-router-pack`
- `bundles/research-bundle`
- `bundles/release-bundle`
- `orchestrators/default-orchestrator`

## 当前示例样本

- `contracts/examples/decision-log.example.json`
- `contracts/examples/trace-span.example.json`
- `contracts/examples/token-usage-report.example.json`
- `packs/schedule-pack/examples/closeout-schedule.example.json`
- `packs/schedule-pack/examples/closeout-run.example.json`
- `packs/skill-router-pack/examples/spec-route.example.json`
- `packs/skill-router-pack/examples/office-hours-route.example.json`
- `orchestrators/default-orchestrator/examples/task-lifecycle.example.json`

## 当前结构含义

- `pack.aivibe.json`
  定义单个基础能力块
- `bundle.aivibe.json`
  定义多 Pack 的工种组合
- `orchestrator.aivibe.json`
  定义这些组合怎么按阶段和状态被编排
- `aivibe.json`
  定义当前项目实例启用哪套能力

## 一句话

**这里是 AIVibe OS 在真实项目里的组织层骨架。**
