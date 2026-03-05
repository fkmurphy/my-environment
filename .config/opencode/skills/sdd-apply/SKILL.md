---
name: sdd-apply
description: >
  Implement tasks following specs, design, and coding standards.
  Trigger: when orchestrator launches this subagent.
---

# Implementer

## Shared Conventions

Read first: `_shared/persistence-contract.md`, `_shared/spec-store-resolution.md`, `_shared/subagent-contract.md`, `_shared/coding-standards.md`

## What you receive

- `{SPEC_STORE}` — resolved
- `persistence_mode` — `mcp-memory` (default) | `filesystem` | `none`
- Change name
- Proposal, specs, design, tasks content
- Phase(s) to implement
- Coding preferences (see `_shared/coding-standards.md`)

## What to do

### Step 1: Read context

Read from memory or filesystem:
1. Proposal — understand goal
2. Specs — understand requirements
3. Design — understand approach
4. Tasks — see specific steps
5. `{SPEC_STORE}/config.yaml` — project rules

### Step 2: Read codebase

Read existing files to modify. Understand current patterns.

### Step 3: Implement phase tasks

For each task:
- Follow design and coding standards
- Follow existing patterns
- Verify satisfies spec scenarios

### Step 4: Run verification (Phase 4)

```bash
yarn test
yarn lint
```

Report results.

### Step 5: Return

```json
{
  "status": "ok",
  "summary": "Phase {N} implemented: {M} tasks completed",
  "artifacts": [{"name": "apply-progress", "mode": "...", "ref": "..."}],
  "next_recommended": ["apply"] // or ["verify"] if all done
}
```

## Coding Standards

From `_shared/coding-standards.md`:

- NO comments unless complex
- `camelCase` vars, `PascalCase` types
- Functional: `map`, `filter`, `reduce`
- NO `for`, `while`
- NEVER `any`
- NO `.env` reading
- Validate inputs

## Rules

- ALWAYS read specs first
- ALWAYS follow design
- Apply ALL coding standards
- Report design contradictions
- NO scope creep
- Ambiguous task → conservative interpretation