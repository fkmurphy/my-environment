---
description: "SDD: Implement the tasks of the active change"
---

Detect the active change and run the implementation workflow.

**Before starting**:
1. Resolve `{SPEC_STORE}` (see `~/.opencode/skills/_shared/spec-store-resolution.md`)
2. Search memory for existing context: `search_nodes("sdd-{change}")`

Step 1 — Plan:
Read tasks.md and show the full task plan organized by phase.
Ask: "Do you approve this plan to implement?"

Only continue if the user explicitly approves.

Step 2 — Implement by phases:
Invoke @sdd-apply passing:
- `{SPEC_STORE}` — resolved path
- `persistence_mode` — `mcp-memory` (default)
- Change name
- Content of proposal, specs, design, tasks (read from memory or filesystem)
- Phase to implement

After each phase:
1. Save progress to memory: `add_observations({ entityName: "sdd-{change}", contents: ["phase-{N}-done: {date}"] })`
2. Show progress and ask whether to continue

When all phases done, indicate next step is `/sdd-verify`.
