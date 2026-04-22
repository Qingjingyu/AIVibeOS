# AIVibe Core

- Use `AGENTS.md` as the root contract.
- Use `commands/` as the stage entry layer.
- Use `skills/` as the executable workflow layer.
- Prefer stage-first execution over jumping directly into implementation.
- When a user intent matches `/spec`, `/plan`, `/build`, `/test`, `/review`, `/code-simplify`, or `/ship`, read the matching file under `commands/` first.
- If a workflow exists in `skills/`, do not replace it with an improvised one unless the task clearly requires it.
