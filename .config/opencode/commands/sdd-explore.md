---
description: "SDD: Explore a topic before proposing a change"
---

Run the SDD exploration workflow for the topic: $ARGUMENTS

Invoke @sdd-explore to:
1. Search MCP memory with `search_nodes "$ARGUMENTS"` for prior related context
2. Analyze the relevant codebase
3. Compare implementation options
4. Return a structured analysis with recommendations

No files are created. Analysis only.

Show the analysis to the user and ask whether to continue with `/sdd-new`.
