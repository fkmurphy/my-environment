---
description: "SDD: Archive the completed active change"
---

Archive the completed change.

**Before starting**:
1. Resolve `{SPEC_STORE}`
2. Check verify-report for CRITICAL issues
3. If CRITICALs exist, warn and do NOT proceed

Invoke @sdd-archive in full mode passing:
- `{SPEC_STORE}` — resolved path
- `persistence_mode` — `mcp-memory` (default)
- Change name
- Mode: `full`

The subagent will:
1. Merge delta specs into source of truth
2. Move change to archive with date prefix
3. Save to MCP memory

**After archive**:
```typescript
create_entities({
  entities: [{
    name: `sdd-{change}`,
    entityType: "sdd-change",
    observations: [
      `archived: {ISO date}`,
      `project: {project}`,
      `key-decision: {from design}`
    ]
  }]
})
```

Show summary of merged specs and confirm archive.