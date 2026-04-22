# AIVibe OS Package 依赖规则

## 目标

定义工作区里包和应用之间的依赖方向，避免互相缠死。

## 默认规则

- `apps/web` 可依赖 `packages/ui`、`packages/shared`、`packages/ai`
- `apps/api` 可依赖 `packages/shared`、`packages/ai`
- `apps/worker` 可依赖 `packages/shared`、`packages/ai`
- `packages/ui` 可依赖 `packages/shared`
- `packages/ai` 可依赖 `packages/shared`
- `packages/shared` 不依赖任何应用层

## 不允许的方向

- `packages/shared -> apps/*`
- `packages/ui -> apps/*`
- `packages/shared -> packages/ui`
- `packages/shared -> packages/ai`

## 一句话铁规矩

**依赖方向一旦反过来，共享层就会失去共享价值。**
