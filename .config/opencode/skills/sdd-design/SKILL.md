---
name: sdd-design
description: >
  Create design.md with technical decisions.
  Trigger: when orchestrator launches this subagent.
---

# Designer

## Shared Conventions

Read first: `../_shared/persistence-contract.md`, `../_shared/spec-store-resolution.md`, `../_shared/subagent-contract.md`

## What you receive

- `{SPEC_STORE}` — resolved
- `persistence_mode` — `mcp-memory` (default) | `filesystem` | `none`
- Change name
- Proposal content
- Specs content | User feedback (revision)

## What to do

### Step 1: Check existence

- NOT exists → first run
- EXISTS → revision, apply feedback only

### Step 2: Read codebase

- Module structure
- Existing patterns
- Interfaces/contracts
- Dependencies
- Test infrastructure

### Step 3: Write design

```markdown
# Design: {Title}

## Technical Approach
{Concise description.}

## Architecture Decisions

### Decision: {Title}
**Choice**: {what}
**Alternatives**: {rejected}
**Rationale**: {why}

## Data Flow

\`\`\`
ComponentA → ComponentB → ComponentC
\`\`\`

## File Changes

| File | Action | Description |
|------|--------|-------------|
| `path.ts` | Create/Modify/Delete | {what} |

## Interfaces
{New types, API contracts.}

## Testing Strategy

| Layer | What | Approach |
|-------|------|----------|
| Unit | {...} | {...} |

## Migration
{If applicable, or "No migration required."}

## Open Questions
- [ ] {question}
```

### Step 4: Persist

**mcp-memory**: `create_entities({ name: "sdd-{change}-design", entityType: "sdd-artifact", observations: [...] })`

**filesystem**: `{SPEC_STORE}/changes/{change}/design.md`

### Step 5: Return

```json
{
  "status": "ok",
  "summary": "Created design with {N} decisions, {M} file changes",
  "artifacts": [{"name": "design", "mode": "...", "ref": "..."}],
  "next_recommended": ["tasks"]
}
```

## Rules

- ALWAYS read real codebase first
- Every decision has rationale
- Concrete file paths
- Follow EXISTING patterns
- Design = HOW; Proposal = WHAT
