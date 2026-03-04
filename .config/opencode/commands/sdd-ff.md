---
description: "SDD: Fast-forward — create all pending artifacts at once"
---

Detect the active change in the spec-store and create all pending artifacts in the correct sequence.

Sequence:
1. If `proposal.md` is missing: invoke @sdd-propose
2. If `specs/` or `design.md` are missing: invoke both in parallel
   - Task 1: @sdd-spec
   - Task 2: @sdd-design
3. Once both finish, if `tasks.md` is missing: invoke @sdd-tasks

After EACH artifact (or parallel batch) is created, show the summary and ask:

  "Do you approve [artifact(s)]?
   - **yes** — continue to the next step
   - **revise: [your feedback]** — I'll update and show again"

RULES for these gates:
- Do NOT proceed to the next artifact in the sequence unless the user responds with "yes"
- Any other response (correction, question, feedback) means: re-invoke the relevant subagent(s)
  with the existing content + feedback, then show the result and ask again
- For the parallel batch (specs + design): if the user approves both together, proceed to tasks.
  If they want to revise one, re-run only that subagent — not both.
- The gate after `tasks.md` is the most important: do not proceed to `/sdd-apply` without
  explicit approval of the task list
- Never interpret silence, a question, or partial feedback as approval
