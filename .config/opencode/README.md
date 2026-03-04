# opencode config

Global opencode configuration with the SDD (Spec-Driven Development) system.

## Directory structure

```
~/.config/opencode/
├── config.json          ← providers, MCPs, agents, keybinds
├── memory/
│   └── memory.jsonl     ← local knowledge graph (MCP memory)
├── spec-store/          ← central artifact store (one subdir per project)
│   └── {project-name}/
│       ├── config.yaml
│       ├── specs/
│       └── changes/
├── agents/              ← sdd-* subagents (hidden, invoked by orchestrator)
├── commands/            ← /sdd-* slash commands
└── skills/              ← SKILL.md instructions loaded by each subagent
```

---

## Active MCPs

| MCP | Command | Purpose |
|---|---|---|
| `context7` | `@upstash/context7-mcp` | Library documentation |
| `memory` | `@modelcontextprotocol/server-memory` | Persistent knowledge graph across sessions |
| `postgres` | `crystaldba/postgres-mcp` | Local DB access (disabled by default) |

---

## SDD Agent

Select the agent with `Tab` / `Shift+Tab`.

**`sdd-orchestrator`** — coordinates the SDD workflow. Never writes code directly.
Delegates everything to sub-agents via the Task tool and asks for approval between phases.

---

## Spec-store: where artifacts live

All SDD artifacts are stored **outside the project repo** to avoid accidental commits.

### Resolution order

1. If `.spec/spec-config.yaml` exists in the project root, read the `store:` value
2. Otherwise, use the default: `~/.config/opencode/spec-store/{project-name}/`

### Team sharing (optional)

If you want specs to live in a shared location (e.g. a synced folder), add `.spec/spec-config.yaml` to the repo:

```yaml
# .spec/spec-config.yaml
store: /path/to/shared/spec-store/my-project
```

This file is safe to commit — no secrets, just a path. The `.spec/` directory is gitignored except for this file:

```gitignore
.spec/
!.spec/spec-config.yaml
```

`/sdd-init` sets this up automatically.

---

## SDD Workflow — Cheatsheet

### Initialize a project

```
/sdd-init
```
Detects the stack, creates `{SPEC_STORE}/config.yaml`, `specs/`, `changes/archive/`.
Adds `.spec/` to `.gitignore` with exception for `spec-config.yaml`.

---

### Full feature workflow

```
/sdd-explore <topic>         ← optional: explore before committing
/sdd-new <name>              ← create change (explore + proposal.md)
/sdd-continue                ← create specs/ and design.md (can run in parallel)
/sdd-continue                ← create tasks.md (requires specs + design)

  → review and approve tasks.md

/sdd-apply                   ← show plan → approve → implement by phases
/sdd-verify                  ← yarn test + yarn lint + validate specs
/sdd-archive                 ← merge specs → move to archive → save to memory
```

### Fast-forward (all artifacts at once)

```
/sdd-new <name>
/sdd-ff                      ← specs + design in parallel, then tasks
/sdd-apply
/sdd-verify
/sdd-archive
```

---

## Available commands

| Command | What it does |
|---|---|
| `/sdd-init` | Initializes spec-store for the current project |
| `/sdd-explore <topic>` | Analyzes options without creating files |
| `/sdd-new <name>` | Creates a new change (explore + proposal) |
| `/sdd-continue` | Creates the next pending artifact for the active change |
| `/sdd-ff` | Fast-forward: all artifacts at once |
| `/sdd-apply` | Task plan → approval → implement by phases |
| `/sdd-verify` | Runs `yarn test` + `yarn lint` and validates against specs |
| `/sdd-sync` | Merges delta specs to `{SPEC_STORE}/specs/` without archiving |
| `/sdd-archive` | Archives the completed change |
| `/sdd-bulk-archive` | Archives multiple changes |

---

## Change structure in {SPEC_STORE}

```
{SPEC_STORE}/
├── config.yaml                        ← stack + project rules
├── specs/                             ← current source of truth
│   └── {domain}/spec.md
└── changes/
    ├── {change-name}/                 ← active change
    │   ├── proposal.md                ← why and what
    │   ├── specs/{domain}/spec.md     ← delta: ADDED/MODIFIED/REMOVED
    │   ├── design.md                  ← how technically
    │   ├── tasks.md                   ← phase checklist
    │   └── verify-report.md           ← result of /sdd-verify
    └── archive/
        └── YYYY-MM-DD-{name}/         ← completed changes
```

### Artifact dependency graph

```
proposal ──→ specs ─────→ tasks ──→ apply ──→ verify ──→ archive
         └──→ design ───↗
```
`specs` and `design` can be generated in parallel with `/sdd-ff`.

---

## Subagents

Each subagent is defined in `agents/` (`mode: subagent`, `hidden: true`) and reads
its `SKILL.md` from `skills/`. The orchestrator invokes them via the Task tool.
They can also be called manually with `@sdd-*`.

| Agent | What it does | Creates |
|---|---|---|
| `sdd-init` | Detects stack, generates config | `{SPEC_STORE}/config.yaml` |
| `sdd-explore` | Analyzes codebase, searches memory, compares options | — |
| `sdd-propose` | Writes the proposal | `proposal.md` |
| `sdd-spec` | Writes delta specs (Given/When/Then, RFC 2119) | `specs/` |
| `sdd-design` | Documents technical decisions and affected files | `design.md` |
| `sdd-tasks` | Creates phase checklist with concrete file paths | `tasks.md` |
| `sdd-apply` | Implements tasks applying coding preferences | code |
| `sdd-verify` | Runs tests/lint and validates specs | `verify-report.md` |
| `sdd-archive` | Merges specs + archives + saves to MCP memory | — |

---

## MCP Memory — knowledge graph

Used by the orchestrator to persist context across sessions.

| Operation | When | MCP tool |
|---|---|---|
| Search active changes | At session start | `search_nodes "sdd-change"` |
| Search prior context | Before `/sdd-explore` | `search_nodes "<topic>"` |
| Save change | When archiving | `create_entities` + `create_relations` |
| Recover after compaction | After context reset | `search_nodes "sdd-change"` |

Each archived change becomes an entity of type `sdd-change` with observations:
key decision, date, archive path, project stack.

---

## Coding preferences (applied by sdd-apply)

- No comments unless logic is complex or non-obvious
- `camelCase` variables/functions · `PascalCase` classes/types
- Functional methods: `map`, `filter`, `reduce`, `forEach`
- No loops: `for`, `while`, `do-while`
- TypeScript: never `any` · `unknown` only when strictly necessary
- Look up repository before DB actions
- Do not read `.env` · no hardcoded credentials
- Validate user inputs

---

## Custom keybinds

| Action | Keybind |
|---|---|
| Leader | `Ctrl+Space` |
| Commands | `Ctrl+P` |
| Agents | `<leader>A` |
| Cycle agent | `Tab` / `Shift+Tab` |
| New session | `<leader>N` |
| Session list | `<leader>L` |
| Export session | `<leader>X` |
| Compact | `<leader>C` |
| Copy message | `<leader>Y` |
| Undo/Redo | `<leader>U` / `<leader>R` |
| Timeline | `<leader>G` |
| Models | `<leader>M` |
| Favorite model | `Ctrl+F` |
| Provider list | `Ctrl+A` |
| Rename session | `Ctrl+R` |
