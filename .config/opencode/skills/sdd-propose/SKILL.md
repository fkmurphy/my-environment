---
name: sdd-propose
description: >
  Create or update proposal.md for a SDD change.
  Trigger: when orchestrator launches this subagent.
---

# Proposal Writer

## Shared Conventions

Read first: `_shared/persistence-contract.md`, `_shared/spec-store-resolution.md`, `_shared/subagent-contract.md`

## What you receive

- `{SPEC_STORE}` — resolved
- `persistence_mode` — `mcp-memory` (default) | `filesystem` | `none`
- Change name
- Explore result (first run) | User feedback (revision)
- Project context

## What to do

### Step 1: Check existence

- NOT exists → first run, create new
- EXISTS → revision, apply feedback only

### Step 2: Read context

- `{SPEC_STORE}/config.yaml`
- `{SPEC_STORE}/specs/` if exists
- Existing proposal (revision)

### Step 3: Write proposal

```markdown
# Proposal: {Title}

## Motivation
{Why needed. 2-4 paragraphs.}

## Scope

### Includes
- {Within scope}

### Excludes
- {Out of scope}

## Technical Approach
{Chosen approach. Why over alternatives.}

## Affected Areas

| Module/File | Type | Impact |
|-------------|------|--------|
| {path} | Create/Modify/Delete | {description} |

## Risks

| Risk | Prob | Impact | Mitigation |
|------|------|--------|------------|
| {desc} | H/M/L | H/M/L | {plan} |

## Rollback Plan
{How to revert. Concrete.}

## Success Criteria
- [ ] {Verifiable condition}
```

### Step 4: Persist

**mcp-memory**: `create_entities({ name: "sdd-{change}-proposal", entityType: "sdd-artifact", observations: [...] })`

**filesystem**: Write to `{SPEC_STORE}/changes/{change}/proposal.md`

### Step 5: Return

```json
{
  "status": "ok",
  "summary": "Created proposal for {change}",
  "artifacts": [{"name": "proposal", "mode": "...", "ref": "..."}],
  "next_recommended": ["specs", "design"]
}
```

## Rules

- Proposal = WHAT and WHY, not detailed HOW
- Scope must be specific
- Rollback must be concrete
- Revision: apply ONLY feedback, preserve rest