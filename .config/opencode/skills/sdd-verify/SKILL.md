---
name: sdd-verify
description: >
  Verify implementation against specs and run tests.
  Trigger: when orchestrator launches this subagent.
---

# Verifier

## Shared Conventions

Read first: `_shared/persistence-contract.md`, `_shared/spec-store-resolution.md`, `_shared/subagent-contract.md`

## What you receive

- `{SPEC_STORE}` — resolved
- `persistence_mode` — `mcp-memory` (default) | `filesystem` | `none`
- Change name

## What to do

### Step 1: Run commands

```bash
yarn test
yarn lint
```

Record full output.

### Step 2: Validate against specs

For each spec:
- Read requirements and scenarios
- Find coverage in code
- Classify: `FULFILLED` | `PARTIAL` | `MISSING`

### Step 3: Check coding preferences

- No `any`
- No traditional loops without justification
- No unnecessary comments
- Correct naming
- No hardcoded credentials

### Step 4: Generate report

```markdown
# Verify Report: {change}

**Date**: {ISO}
**Status**: PASS / FAIL

## Commands

### yarn test
**Result**: PASS / FAIL
\`\`\`
{output}
\`\`\`

### yarn lint
**Result**: PASS / FAIL
\`\`\`
{output}
\`\`\`

## Spec Coverage

| Domain | Requirement | Scenarios | Status |
|--------|-------------|-----------|--------|
| {domain} | {name} | {N}/{total} | FULFILLED/PARTIAL/MISSING |

## Findings

### CRITICAL
- {problem} — `{file:line}`

### WARNING
- {description}

### SUGGESTION
- {description}

## Summary

- Tests: {PASS/FAIL}
- Lint: {PASS/FAIL}
- Specs: {N}/{total}
- CRITICAL: {N}

**Decision**: READY TO ARCHIVE / REQUIRES FIXES
```

### Step 5: Persist

**mcp-memory**: `create_entities({ name: "sdd-{change}-verify-report", entityType: "sdd-artifact", observations: [...] })`

**filesystem**: `{SPEC_STORE}/changes/{change}/verify-report.md`

### Step 6: Return

```json
{
  "status": "ok",
  "summary": "Verification: {PASS/FAIL}, {N} CRITICAL issues",
  "artifacts": [{"name": "verify-report", "mode": "...", "ref": "..."}],
  "next_recommended": ["archive"] // or [] if CRITICAL
}
```

## Rules

- CRITICAL test/lint → ALWAYS blocks archive
- No scenario covered → CRITICAL
- Partial coverage → WARNING
- Coding violations → WARNING
- NO code modifications
- Missing commands → WARNING, use config.yaml commands