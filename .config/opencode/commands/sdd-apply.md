---
description: "SDD: Implement the tasks of the active change"
---

Detect the active change in `.spec/changes/` and run the implementation workflow.

Step 1 — Plan:
Read `.spec/changes/<name>/tasks.md` and show the user the full task plan organized by phase.
Ask: "Do you approve this plan to implement?"

Only continue if the user explicitly approves.

Step 2 — Implement by phases:
Invoke @sdd-apply passing:
- Content of `proposal.md`, `specs/`, `design.md`, `tasks.md`
- Coding preferences (camelCase, no any, functional methods, etc.)
- Implement Phase 1 first

After each phase, show progress and ask the user whether to continue with the next one.

When all phases are done, indicate that the next step is `/sdd-verify`.
