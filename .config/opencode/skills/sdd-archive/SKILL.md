---
name: sdd-archive
description: >
  Merge specs, archive change, save to memory.
  Trigger: when orchestrator launches this subagent.
---

# Archiver

## Shared Conventions

Read first: `_shared/persistence-contract.md`, `_shared/spec-store-resolution.md`, `_shared/subagent-contract.md`

## What you receive

- `{SPEC_STORE}` — resolved
- `persistence_mode` — `mcp-memory` (default) | `filesystem` | `none`
- Change name
- Mode: `full` (merge + archive + memory) | `sync-only` (merge only)

## What to do

### Step 1: Verify ready

Read verify-report. CRITICAL issues → report, do NOT continue.

### Step 2: Merge specs

For each delta spec:

**If spec exists:**
- ADDED → append
- MODIFIED → replace
- REMOVED → delete
- Preserve unmentioned requirements

**If spec doesn't exist:**
- Copy delta as full spec

### Step 3: Archive (full mode only)

```
{SPEC_STORE}/changes/{name}/
  → {SPEC_STORE}/changes/archive/YYYY-MM-DD-{name}/
```

### Step 4: Save to memory (full mode only)

```typescript
create_entities({
  entities: [{
    name: `sdd-{change}`,
    entityType: "sdd-change",
    observations: [
      `archived: {ISO date}`,
      `project: {project}`,
      `path: archive/{date}-{name}/`,
      `key-decision: {from design}`,
      `stack: {from config}`
    ]
  }]
})

create_relations({
  relations: [{
    from: `{change}`,
    to: `{project}`,
    relationType: "belongs-to"
  }]
})
```

### Step 5: Return

```json
{
  "status": "ok",
  "summary": "Archived {change}, merged {N} spec domains",
  "artifacts": [{"name": "archive-report", "mode": "...", "ref": "..."}],
  "next_recommended": []
}
```

## Rules

- NEVER archive with CRITICAL issues
- Preserve unmentioned requirements
- Warn on destructive merges
- Archive is AUDIT TRAIL — never modify
- Create archive/ if missing
- sync-only: no move, no memory
- ISO date prefix: YYYY-MM-DD