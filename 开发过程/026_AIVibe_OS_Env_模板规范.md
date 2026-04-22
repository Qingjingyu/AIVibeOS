# AIVibe OS Env 模板规范

## 目标

统一新项目的环境变量写法，避免每个项目都重新发明命名和分层方式。

## 基本原则

- 所有项目必须提供 `.env.example`
- 敏感值不提交真实内容
- 变量按应用和能力分组
- AI 相关变量和业务变量分开

## 推荐分组

- App 基础信息
- 数据库与存储
- 第三方服务
- AI Runtime
- 监控与日志

## 示例结构

```dotenv
APP_ENV=development
APP_PORT=3000

DATABASE_URL=
REDIS_URL=

OPENAI_API_KEY=
ANTHROPIC_API_KEY=
AI_DEFAULT_PROVIDER=openai

LOG_LEVEL=info
SENTRY_DSN=
```

## 一句话铁规矩

**环境变量必须可读、可分组、可复制启动，不允许靠口口相传。**
