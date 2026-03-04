---
name: sdd-orchestrator
description: >
  Global context for the Spec-Driven Development (SDD) system.
  Available to all agents across all projects.
---

# Spec-Driven Development (SDD)

A development system where the AI generates planning artifacts that the user
reviews and approves before any code is written.

## Spec-store: where artifacts live

All SDD artifacts are stored OUTSIDE the project repo to avoid accidental commits.

### Resolution order

1. Check if `.spec/spec-config.yaml` exists in the project root
2. If it exists, read the `store:` value → use that path as `{SPEC_STORE}`
3. If it does not exist, use the default: `~/.config/opencode/spec-store/{project-name}/`
   where `{project-name}` is the name of the current working directory

### `.spec/spec-config.yaml` (safe to commit)

This is the ONLY file that lives in the repo under `.spec/`. It is safe to commit
because it contains no secrets — just a path override for team sharing.

```yaml
# .spec/spec-config.yaml
store: /path/to/shared/spec-store/my-project
```

When running `/sdd-init`, the `.gitignore` must include:
```
.spec/
!.spec/spec-config.yaml
```

## File structure in {SPEC_STORE}

```
{SPEC_STORE}/
├── config.yaml              ← detected stack + project rules
├── specs/                   ← current source of truth
│   └── {domain}/
│       └── spec.md
└── changes/
    ├── {change-name}/       ← active change
    │   ├── proposal.md
    │   ├── specs/           ← delta specs (ADDED/MODIFIED/REMOVED)
    │   ├── design.md
    │   ├── tasks.md
    │   └── verify-report.md
    └── archive/
        └── YYYY-MM-DD-{name}/
```

## Artifacts and their purpose

| Artifact | Answers | Depends on |
|---|---|---|
| `proposal.md` | Why and what | Nothing |
| `specs/` | What it must fulfill (Given/When/Then) | proposal |
| `design.md` | How technically | proposal |
| `tasks.md` | Implementation checklist | specs + design |
| `verify-report.md` | Post-implementation validation | implementation |

## Available commands

- `/sdd-init` — initialize spec-store for the project
- `/sdd-explore [topic]` — analyze options without creating files
- `/sdd-new [name]` — create new change (explore + propose)
- `/sdd-continue` — create the next pending artifact
- `/sdd-ff` — fast-forward: all artifacts at once
- `/sdd-apply` — implement tasks (plan first, then implement)
- `/sdd-verify` — validate implementation against specs
- `/sdd-sync` — merge delta specs to source of truth
- `/sdd-archive` — archive completed change
- `/sdd-bulk-archive` — archive multiple changes

## MCP Memory (local knowledge graph)

Entities saved when archiving each change:
- Type: `sdd-change`
- Observations: key decisions, archive path, date
- Relation: `belongs-to` → project name

Search with `search_nodes` at session start or before exploring a new topic.
