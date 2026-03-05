---
description: "SDD: Create a new change (explore + propose)"
---

Create a new SDD change named: $ARGUMENTS

**Before starting**:
1. Resolve `{SPEC_STORE}`
2. Search memory: `search_nodes("$ARGUMENTS")`

Step 1 — Explore:
Invoke @sdd-explore passing:
- `{SPEC_STORE}` — resolved path
- Topic/change name
- Prior context from memory

Show analysis and ask: "Continue with proposal, or adjust direction first?"

Wait for explicit confirmation.

Step 2 — Propose:
Invoke @sdd-propose passing:
- `{SPEC_STORE}` — resolved path
- `persistence_mode` — `mcp-memory` (default)
- Change name
- Explore result

Step 3 — Approval loop:
Show proposal and ask:
```
Do you approve this proposal?
- **yes** — continue to /sdd-continue
- **revise: [feedback]** — update and show again
- **abort** — cancel change
```

**After "yes"**:
```typescript
create_entities({
  entities: [{
    name: `sdd-{change}`,
    entityType: "sdd-change",
    observations: [
      `created: {ISO date}`,
      `project: {project}`,
      `motivation: {1-line}`,
      `proposal-approved: {ISO date}`
    ]
  }]
})
```

**Rules**:
- Only proceed on explicit "yes"
- "revise:" → re-invoke with feedback
- "abort" → cancel, no further actions
- Never interpret silence as approval