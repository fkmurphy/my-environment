---
name: sdd-status
description: >
  Show status of all active SDD changes.
---

# Status Reporter

## What to do

### Step 1: Resolve spec-store

Check `.spec/spec-config.yaml` or use default.

### Step 2: List changes

For each project in spec-store:
- List `changes/` (exclude `archive/`)
- Check which artifacts exist
- Check for blocking issues

### Step 3: Query memory

```typescript
search_nodes({ query: "sdd-" })
```

### Step 4: Format output

```
SDD Status — {date}

═══════════════════════════════════════════════════════

Project: chat-service

├── faq-export (active, phase: tasks)
│   ├── ✓ proposal
│   ├── ✓ specs
│   ├── ✓ design
│   ├── ✓ tasks
│   └── ✗ verify-report (missing)
│
├── legacy-sync (active, phase: specs, BLOCKED)
│   ├── ✓ proposal
│   ├── ✗ specs (missing)
│   └── ⚠ verify-report has 2 CRITICAL issues
│
└── 3 archived changes

───────────────────────────────────────────────────────

Project: pedidos

└── 1 active change

═══════════════════════════════════════════════════════

Memory: 12 SDD entities
Changes: 4 active, 3 archived
Blocked: 1 (legacy-sync)

Run /sdd-history to search past decisions.
```

## Artifact Detection

Check for existence:
- `proposal.md` or `sdd-{change}-proposal` in memory
- `specs/` directory or `sdd-{change}-spec` in memory
- `design.md` or `sdd-{change}-design` in memory
- `tasks.md` or `sdd-{change}-tasks` in memory
- `verify-report.md` or `sdd-{change}-verify-report` in memory

## Status Indicators

| Symbol | Meaning |
|--------|---------|
| ✓ | Present |
| ✗ | Missing |
| ⚠ | Has issues |
| BLOCKED | Has CRITICAL issues |

## Rules

- Show all active changes
- Highlight blocked changes
- Count archived changes
- Show memory usage
