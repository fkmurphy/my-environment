---
description: "SDD: Archive multiple completed changes"
---

Archive multiple completed changes at once.

**Before starting**:
1. Resolve `{SPEC_STORE}`
2. List all active changes (not in archive/)

Show the list and ask which ones to archive ("all" or selection).

For each selected change:
1. Verify no CRITICAL issues in verify-report
2. Invoke @sdd-archive in full mode
3. Save to memory after each archive
4. Show result before continuing

If merge conflicts detected (same requirement modified by multiple changes):
- Warn user
- Ask for manual resolution
- Continue with remaining changes

When done, show summary:
```
Archived {N} changes:
- {change-1} → archive/2026-03-04-{change-1}/
- {change-2} → archive/2026-03-04-{change-2}/
```