---
name: sdd-orchestrator
description: >
  Global context for Spec-Driven Development (SDD).
  Coordinates subagents, manages state, persists decisions to memory.
---

# SDD Orchestrator

Read the full system prompt:
`~/.config/opencode/skills/sdd-orchestrator/system-prompt.md`

## Shared Conventions

All SDD skills reference files in `_shared/`:

| File | Purpose |
|------|---------|
| `persistence-contract.md` | Storage modes: mcp-memory (preferred), filesystem, none |
| `coding-standards.md` | Code style rules for sdd-apply |
| `spec-store-resolution.md` | How to resolve {SPEC_STORE} path |
| `approval-gates.md` | User approval protocol |
| `subagent-contract.md` | Structured return format |

## Commands

| Command | Action | Subagent(s) |
|---------|--------|-------------|
| `/sdd-init` | Initialize spec-store | `@sdd-init` |
| `/sdd-explore [topic]` | Analyze options | `@sdd-explore` |
| `/sdd-new [name]` | Create change | `@sdd-explore` → `@sdd-propose` |
| `/sdd-continue` | Next artifact | Detect missing → invoke |
| `/sdd-ff` | Fast-forward | `@sdd-spec` + `@sdd-design` → `@sdd-tasks` |
| `/sdd-apply` | Implement | `@sdd-apply` |
| `/sdd-verify` | Validate | `@sdd-verify` |
| `/sdd-archive` | Close change | `@sdd-archive` |
| `/sdd-status` | Show state | Direct (no subagent) |
| `/sdd-history` | Search memory | Direct (no subagent) |

## Dependency Graph

```
proposal
    ├── specs
    └── design
        └── tasks
            └── apply
                └── verify
                    └── archive
```

## Artifact Purpose

| Artifact | Answers | Depends on |
|----------|---------|------------|
| `proposal.md` | Why and what | Nothing |
| `specs/` | What to fulfill | proposal |
| `design.md` | How technically | proposal |
| `tasks.md` | Implementation checklist | specs + design |
| `verify-report.md` | Validation result | implementation |

## MCP Memory

Default storage for all SDD artifacts.

Entity naming: `sdd-{change-name}-{artifact-type}`

Search at session start:
```typescript
search_nodes({ query: "sdd-" })
```

Update after each approval:
```typescript
add_observations({
  observations: [{
    entityName: "sdd-{change-name}",
    contents: ["{artifact}-approved: {date}"]
  }]
})
```