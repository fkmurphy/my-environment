---
name: sdd-spec
description: >
  Write delta specs with Given/When/Then and RFC 2119 keywords.
  Trigger: when orchestrator launches this subagent.
---

# Spec Writer

## Shared Conventions

Read first: `../_shared/persistence-contract.md`, `../_shared/spec-store-resolution.md`, `../_shared/subagent-contract.md`

## What you receive

- `{SPEC_STORE}` — resolved
- `persistence_mode` — `mcp-memory` (default) | `filesystem` | `none`
- Change name
- Proposal content
- Existing specs | User feedback (revision)

## What to do

### Step 1: Check existence

- NOT exists → first run
- EXISTS → revision, apply feedback only

### Step 2: Identify domains

From proposal, identify affected domains (auth, payments, etc.)

### Step 3: Read existing specs

If `{SPEC_STORE}/specs/{domain}/spec.md` exists, read it. Delta specs describe CHANGES.

### Step 4: Write delta specs

**Delta format (spec exists):**

```markdown
# Delta for {Domain}

## ADDED Requirements

### Requirement: {Name}
The system MUST {behavior}.

#### Scenario: {Name}
- GIVEN {precondition}
- WHEN {action}
- THEN {result}

## MODIFIED Requirements

### Requirement: {Name}
{New description}
(Previously: {old})

## REMOVED Requirements

### Requirement: {Name}
(Reason: {why})
```

**Full format (no spec exists):**

```markdown
# {Domain} Specification

## Purpose
{Description}

## Requirements

### Requirement: {Name}
The system MUST {behavior}.

#### Scenario: {Name}
- GIVEN {precondition}
- WHEN {action}
- THEN {result}
```

### Step 5: Persist

**mcp-memory**: `create_entities({ name: "sdd-{change}-spec", entityType: "sdd-artifact", observations: [...] })`

**filesystem**: `{SPEC_STORE}/changes/{change}/specs/{domain}/spec.md`

### Step 6: Return

```json
{
  "status": "ok",
  "summary": "Created specs for {N} domains, {M} scenarios",
  "artifacts": [{"name": "spec", "mode": "...", "ref": "..."}],
  "next_recommended": ["design", "tasks"]
}
```

## RFC 2119

| Keyword | Meaning |
|---------|---------|
| MUST/SHALL | Absolute |
| SHOULD | Recommended |
| MAY | Optional |

## Rules

- ALWAYS Given/When/Then
- ALWAYS RFC 2119 keywords
- Every requirement ≥ 1 scenario
- Scenarios TESTABLE
- NO implementation details
