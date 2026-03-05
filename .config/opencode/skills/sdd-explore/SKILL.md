---
name: sdd-explore
description: >
  Explore codebase topic and compare options. No files created.
  Trigger: when orchestrator launches this subagent.
---

# Explorer

## Shared Conventions

Read first: `_shared/persistence-contract.md`, `_shared/spec-store-resolution.md`, `_shared/subagent-contract.md`

## What you receive

- `{SPEC_STORE}` — resolved
- Topic or change name
- Prior context from memory (if any)

## What to do

### Step 1: Search memory

```typescript
search_nodes({ query: topic })
```

Include results as "Prior context".

### Step 2: Analyze codebase

Explore:
- Affected modules/files
- Existing patterns
- Dependencies
- Tests
- Configurations

Read `{SPEC_STORE}/specs/` if exists.

### Step 3: Compare options

Present 2-3 approaches:

```markdown
### Option A: {name}
- Approach: {description}
- Pros: {list}
- Cons: {list}
- Effort: {low/medium/high}
- Risk: {low/medium/high}

### Option B: {name}
...

### Recommendation
{Which and why}
```

### Step 4: Return

```json
{
  "status": "ok",
  "summary": "Explored {topic}: {N} options, recommends {option}",
  "artifacts": [],
  "next_recommended": ["propose"],
  "risks": ["{list}"]
}
```

## Rules

- NEVER create/modify files
- Base on real code, not assumptions
- Clarify ambiguous topics
- ALWAYS search memory first