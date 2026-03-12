---
name: sdd-tasks
description: >
  Create tasks.md with phase-organized checklist.
  Trigger: when orchestrator launches this subagent.
---

# Task Planner

## Shared Conventions

Read first: `../_shared/persistence-contract.md`, `../_shared/spec-store-resolution.md`, `../_shared/subagent-contract.md`, `../_shared/coding-standards.md`

## What you receive

- `{SPEC_STORE}` — resolved
- `persistence_mode` — `mcp-memory` (default) | `filesystem` | `none`
- Change name
- Proposal, specs, design content | User feedback (revision)

## What to do

### Step 1: Check existence

- NOT exists → first run
- EXISTS → revision, apply feedback only

### Step 2: Analyze design

Identify files, dependency order, testing requirements.

### Step 3: Write tasks

```markdown
# Tasks: {Title}

## Phase 1: Foundation

- [ ] 1.1 {Concrete action — file, what}
- [ ] 1.2 {Concrete action}

## Phase 2: Core

- [ ] 2.1 {Concrete action}

## Phase 3: Integration

- [ ] 3.1 {Concrete action}

## Phase 4: Testing

- [ ] 4.1 {Write tests for...}
- [ ] 4.2 Verify scenario: "GIVEN... WHEN... THEN..."
- [ ] 4.3 Run `yarn test`
- [ ] 4.4 Run `yarn lint`

## Phase 5: Cleanup (optional)

- [ ] 5.1 {Remove temp code}
```

### Phase Guide

| Phase | Contains |
|-------|----------|
| 1. Foundation | Types, DB, config |
| 2. Core | Main logic |
| 3. Integration | Wiring, routes |
| 4. Testing | Tests, verify |
| 5. Cleanup | Polish |

### Task Criteria

| Criterion | Correct | Incorrect |
|-----------|---------|-----------|
| Specific | "Create `auth.ts` with JWT" | "Add auth" |
| Actionable | "Add `validateToken()`" | "Handle tokens" |
| Verifiable | "Test: POST /login 401" | "Make it work" |
| Small | One file/unit | "Implement feature" |

### Step 4: Persist

**mcp-memory**: `create_entities({ name: "sdd-{change}-tasks", entityType: "sdd-artifact", observations: [...] })`

**filesystem**: `{SPEC_STORE}/changes/{change}/tasks.md`

### Step 5: Return

```json
{
  "status": "ok",
  "summary": "Created {N} tasks in {M} phases",
  "artifacts": [{"name": "tasks", "mode": "...", "ref": "..."}],
  "next_recommended": ["apply"]
}
```

## Rules

- Concrete file paths
- Dependency order
- Testing tasks reference spec scenarios
- Each task = one session
- Phase 4: ALWAYS `yarn test` + `yarn lint`
