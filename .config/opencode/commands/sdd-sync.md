---
description: "SDD: Merge delta specs without archiving"
---

Merge delta specs into source of truth without archiving the change.

**Before starting**:
1. Resolve `{SPEC_STORE}`

Invoke @sdd-archive in sync-only mode passing:
- `{SPEC_STORE}` — resolved path
- `persistence_mode` — `mcp-memory` (default)
- Change name
- Mode: `sync-only`

The subagent will:
- Merge each delta spec into main specs
- Apply ADDED/MODIFIED/REMOVED sections
- NOT move change to archive
- NOT save to memory

Show summary of updated specs.

Use when you want to update source of truth without closing the change.