---
description: "SDD: Create the next artifact of the active change"
---

Create the next missing artifact for the active change.

**Before starting**:
1. Resolve `{SPEC_STORE}`
2. Detect active change (not in archive/)
3. If multiple active, ask which one

Dependency chain:
1. `proposal` → no deps
2. `specs` → requires proposal
3. `design` → requires proposal (parallel with specs)
4. `tasks` → requires specs + design

Detect missing artifact and invoke subagent:
- Missing `specs`: invoke @sdd-spec
- Missing `design`: invoke @sdd-design
- Missing `tasks`: invoke @sdd-tasks

Pass to subagent:
- `{SPEC_STORE}` — resolved
- `persistence_mode` — `mcp-memory` (default)
- Change name
- Content of dependency artifacts (read from memory or filesystem)

After subagent finishes:
Show artifact and ask:
```
Do you approve this {artifact}?
- **yes** — ready for next step
- **revise: [feedback]** — update and show again
```

**After "yes"**:
```typescript
add_observations({
  observations: [{
    entityName: `sdd-{change}`,
    contents: [
      `{artifact}-approved: {ISO date}`,
      `key-decision: {1-line summary}`
    ]
  }]
})
```

**Rules**:
- Only proceed on explicit "yes"
- "revise:" → re-invoke with feedback
- Each artifact has independent gate