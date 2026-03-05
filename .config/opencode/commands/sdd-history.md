---
description: "SDD: Search SDD decisions in memory"
---

Search archived changes and decisions stored in MCP memory.

Usage:
- `/sdd-history` — list all SDD entities
- `/sdd-history {topic}` — search for topic-related decisions
- `/sdd-history sdd-{change}` — search specific change

Execute directly (no subagent needed):
1. Search memory: `search_nodes({ query: query || "sdd-" })`
2. Get full content: `open_nodes({ names: [...] })`

Display matching entities with:
- Change name and status (active/archived)
- Project
- Key decisions
- Dates

See skill at `~/.config/opencode/skills/sdd-history/SKILL.md`