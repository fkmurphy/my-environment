---
description: "SDD: Show status of all active changes"
---

Show the current state of all SDD changes.

Execute directly (no subagent needed):
1. Resolve `{SPEC_STORE}`
2. Search memory: `search_nodes("sdd-")`
3. List changes from filesystem

Display:
- Active changes per project
- Missing artifacts per change
- Blocked changes (CRITICAL issues)
- Memory usage summary
- Archived changes count

See skill at `~/.config/opencode/skills/sdd-status/SKILL.md`