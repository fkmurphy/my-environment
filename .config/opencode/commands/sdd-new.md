---
description: "SDD: Create a new change (explore + propose)"
---

Create a new SDD change named: $ARGUMENTS

Step 1 — Explore first:
Invoke @sdd-explore with the change name "$ARGUMENTS" as context.
Search MCP memory with `search_nodes "$ARGUMENTS"` for prior context.

Show the analysis and ask: "Do you want to continue with the proposal, or adjust the direction first?"
Wait for explicit confirmation before proceeding.

Step 2 — Propose:
Invoke @sdd-propose, passing the explore result as context.
The subagent creates the proposal file in the spec-store.

Step 3 — Iterative review loop:
Show the full proposal to the user and ask exactly this:

  "Do you approve this proposal?
   - **yes** — continue to `/sdd-continue`
   - **revise: [your feedback]** — I'll update the proposal and show it again"

RULES for this loop:
- Do NOT proceed to the next step unless the user responds with an explicit "yes"
- Any other response (correction, question, feedback) means: invoke @sdd-propose again
  passing the existing proposal content + the user's feedback as context, then show
  the updated proposal and ask again
- This loop repeats as many times as needed until the user explicitly approves
- Never interpret silence, a question, or partial feedback as approval
