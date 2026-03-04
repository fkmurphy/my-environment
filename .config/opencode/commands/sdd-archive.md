---
description: "SDD: Archive the completed active change"
---

Detect the active change in `.spec/changes/` and archive it.

Verify that `verify-report.md` exists with no CRITICAL issues. If there are CRITICALs, warn the user and do not proceed.

Invoke @sdd-archive in full mode to:
1. Merge delta specs from `.spec/changes/<name>/specs/` → `.spec/specs/`
2. Move `.spec/changes/<name>/` → `.spec/changes/archive/YYYY-MM-DD-<name>/`
3. Save memory in MCP: `create_entities` with type "sdd-change" and change observations

Show the summary of updated specs and confirm the change was archived.
