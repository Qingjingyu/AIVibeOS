@AGENTS.md
@commands/README.md
@skills/README.md

# Claude Adapter

Use this file as the Claude Code entry adapter for AIVibe OS.

## Default Behavior

- Follow the stage-first workflow from `AGENTS.md`
- Prefer `commands/` to determine the current stage
- Prefer `skills/` to determine the exact workflow
- Treat `开发过程/` as the durable operating system layer

## Practical Routing

- If the task is unclear, start from `/spec`
- If the task already has a clear spec, go to `/plan`
- If the task is implementation-ready, go to `/build`
- If the user is asking for proof, go to `/test`
- If the task is merge/readiness focused, go to `/review`
- If the task is simplification-focused, go to `/code-simplify`
- If the task is delivery-focused, go to `/ship`

## Repo-Specific Notes

- Most work in this repo is Markdown, rules, skills, and governance
- Keep changes small, linked, and discoverable from repo entrypoints
- After changing the system layer, refresh governance outputs
