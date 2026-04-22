# AIVibe OS Trace / Span / Event 模板

## Trace

- trace_id：
- request_id：
- session_id：
- task_name：
- start_time：
- end_time：
- final_status：

## Span

### Span 1

- span_id：
- parent_span_id：
- span_type：
- start_time：
- end_time：
- status：

推荐类型：

- generation
- tool_call
- handoff
- guardrail
- retry
- degrade

## Event

### Event 1

- event_type：
- event_time：
- related_span：
- summary：

推荐事件：

- interrupt
- resume
- retry_start
- retry_end
- degrade_triggered
- tripwire_hit
- failure

## 一句话铁规矩

**Trace 讲整条链，Span 讲一步，Event 讲关键瞬间；三层缺一层，排障都会发虚。**
