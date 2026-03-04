---
description: "SDD: Initialize .spec/ in the current project"
---

Run the SDD initialization workflow in the current project.

Invoke @sdd-init to:
1. Detect the project's tech stack
2. Create the `{SPEC_STORE}/config.yaml`, `{SPEC_STORE}/specs/`, `{SPEC_STORE}/changes/archive/` structure and write `.spec/spec-config.yaml` in the project root
3. Return a summary of what was detected and created

Show the summary to the user and confirm the project is ready for SDD.
