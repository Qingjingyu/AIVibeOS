# default-orchestrator

## 作用

把 `commands -> skills -> bundles -> governance` 按阶段和状态串起来。

## 当前职责

- 阶段切换
- 失败升级
- 完成前验证
- 收尾触发

## 默认服务阶段

- `/spec`
- `/plan`
- `/build`
- `/test`
- `/review`
- `/ship`

## 示例

- `examples/task-lifecycle.example.json`
