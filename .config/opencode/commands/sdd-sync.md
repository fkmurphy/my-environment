---
description: "SDD: Merge delta specs into the main spec without archiving"
---

Detect the active change in `.spec/changes/` and merge its delta specs into `.spec/specs/` without archiving the change.

Invoke @sdd-archive in sync-only mode:
- Merge each delta spec from `.spec/changes/<name>/specs/` into `.spec/specs/`
- For existing specs: apply ADDED/MODIFIED/REMOVED sections
- For new specs: copy directly
- Do NOT move the change to archive

Show a summary of which specs were updated.
Useful when you want to update the source of truth without closing the change yet.
