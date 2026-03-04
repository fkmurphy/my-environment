---
description: "SDD: Create the next artifact of the active change"
---

Detect the active change in the spec-store (the one not in `archive/`) and create the next artifact in the dependency chain.

Dependency chain:
1. `proposal.md` → requires: nothing
2. `specs/` → requires: `proposal.md`
3. `design.md` → requires: `proposal.md` (can run in parallel with specs)
4. `tasks.md` → requires: `specs/` + `design.md`

If there is more than one active change, ask the user which one to continue.

Detect the next missing artifact and invoke the corresponding subagent:
- Missing `specs/`: invoke @sdd-spec
- Missing `design.md`: invoke @sdd-design
- Missing `tasks.md`: invoke @sdd-tasks

After the subagent finishes, show the full artifact summary to the user and ask exactly this:

  "Do you approve this [artifact name]?
   - **yes** — ready for the next step
   - **revise: [your feedback]** — I'll update it and show it again"

RULES for this gate:
- Do NOT proceed to the next artifact unless the user responds with an explicit "yes"
- Any other response (correction, question, feedback) means: invoke the same subagent again
  passing the existing artifact content + the user's feedback, then show the result and ask again
- This loop repeats as many times as needed until the user explicitly approves
- Never interpret silence, a question, or partial feedback as approval
- Each artifact has its own independent approval gate — approving specs does not approve design
