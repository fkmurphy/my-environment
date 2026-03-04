---
description: "SDD: Archive multiple completed changes"
---

List all active changes in `.spec/changes/` (excluding `archive/`).

Show the list to the user and ask which ones to archive. Can be "all" or a selection.

For each selected change, in sequence:
1. Verify it has `verify-report.md` with no CRITICALs
2. Invoke @sdd-archive in full mode
3. Show the result before continuing with the next one

If there are conflicts when merging specs (two changes modify the same requirement), warn the user and ask for manual resolution before continuing.

When done, show a summary of all archived changes.
