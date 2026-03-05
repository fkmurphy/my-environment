---
description: "SDD: Verify implementation against specs"
---

Verify the implementation of the active change.

**Before starting**:
1. Resolve `{SPEC_STORE}`
2. Search memory: `search_nodes("sdd-{change}")`

Invoke @sdd-verify passing:
- `{SPEC_STORE}` — resolved path
- `persistence_mode` — `mcp-memory` (default)
- Change name

The subagent will:
1. Run `yarn test` and `yarn lint`
2. Validate spec coverage
3. Generate verify-report.md

**After verification**:
Save to memory: `add_observations({ entityName: "sdd-{change}", contents: ["verify-status: {PASS/FAIL}", "critical-issues: {N}"] })`

Show the report. If CRITICALs exist, indicate they must be resolved before `/sdd-archive`.
If OK, indicate next step is `/sdd-archive`.