---
description: "SDD: Fast-forward — create all pending artifacts"
---

Create all pending artifacts in correct sequence.

**Before starting**:
1. Resolve `{SPEC_STORE}`
2. Detect active change

Sequence:
1. If proposal missing → invoke @sdd-propose
2. If specs OR design missing → invoke BOTH in parallel
   - Task 1: @sdd-spec
   - Task 2: @sdd-design
3. After both finish, if tasks missing → invoke @sdd-tasks

Pass to each subagent:
- `{SPEC_STORE}` — resolved
- `persistence_mode` — `mcp-memory` (default)
- Change name
- Dependency content (from memory or filesystem)

After EACH artifact (or parallel batch):
Show and ask:
```
Do you approve {artifact(s)}?
- **yes** — continue to next step
- **revise: [feedback]** — update and show again
```

**After "yes"**:
```typescript
add_observations({
  observations: [{
    entityName: `sdd-{change}`,
    contents: [
      `{artifact}-approved: {ISO date}`,
      `key-decision: {summary}`
    ]
  }]
})
```

**Rules**:
- Only proceed on explicit "yes"
- Parallel batch: if user wants to revise one, re-run only that subagent
- Gate after tasks.md is critical: no apply without approval
- Never interpret silence as approval