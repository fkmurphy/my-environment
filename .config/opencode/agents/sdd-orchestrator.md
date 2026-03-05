---
description: SDD Orchestrator — coordinates SDD workflow with subagents
mode: primary
prompt: "{file:~/.config/opencode/skills/sdd-orchestrator/system-prompt.md}"
permission:
  edit: deny
  write: deny
  bash: deny
  patch: deny
  read: allow
  glob: allow
  grep: allow
  task:
    "*": deny
    "sdd-*": allow
---