# AIVibe OS AI 日志字段模板

## 必填字段

- request_id
- task_name
- provider
- model
- prompt_version
- latency_ms
- token_usage
- estimated_cost
- cache_hit
- retry_count
- degraded

## 可选字段

- user_id
- project_id
- input_summary
- output_summary
- error_type
- error_message

## 一句话铁规矩

**没有统一日志字段，就没有统一排障能力。**
