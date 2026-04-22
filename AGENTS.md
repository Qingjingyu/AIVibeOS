# Repository Guidelines

## What This Repo Is
This repository is the mother repo of `AIVibe OS`, a docs-first operating system for AI-assisted product development. It is not a business app repo. Treat it as a system repo that defines workflow, skills, quality gates, and reusable delivery standards.

## Start Order
When entering this repo for real work, use this order:

1. `开发过程/020_AIVibe_OS_总索引.md`
2. `开发过程/000_Roadmap.md`
3. `commands/README.md`
4. `skills/README.md`

## Stage-First Workflow
Do not jump straight into implementation. Default flow:

`/spec -> /plan -> /build -> /test -> /review -> /ship`

Each stage should use the matching file under `commands/` and the matching workflow under `skills/`.

## Source Of Truth
- Root rules: `AGENTS.md`
- Claude adapter: `CLAUDE.md`, `.claude/rules/`
- Cursor adapter: `.cursor/rules/`, `.cursor/commands/`
- Execution workflows: `skills/`
- Core system docs: `开发过程/`

Keep these layers thin and consistent. Do not redefine the same rule in multiple places unless the tool needs a local translation.

## Editing Rules
- Prefer concise Chinese for repo docs unless the target file is already English.
- Keep Markdown structure clean and directly actionable.
- If you add a new system capability, update the nearest entrypoint or index instead of leaving it isolated.
- If you change workflow, quality, or tool behavior, update the relevant file under `开发过程/`.

## Quality Bar
- No spec, no development
- No verification evidence, no completion claim
- No rollback path, no release claim
- No silent tool drift between `commands/`, `skills/`, and adapter files

## Repo Areas
- `commands/`: stage entry files
- `skills/`: executable workflow layer
- `开发过程/`: system rules, roadmap, operating docs
- `02_Spec模板/`: reusable templates
- `03_QA与验收/`: QA and release artifacts
- `Top能力/`: stronger standalone capability packs

## Governance
For substantial system changes, refresh governance outputs:

```bash
bash ./scripts/governance/run-aivibe-closeout.sh
```
