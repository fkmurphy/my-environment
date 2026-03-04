---
name: sdd-propose
description: >
  Create or update the proposal.md for a SDD change.
  Trigger: when the orchestrator launches this subagent to write or revise a proposal.
---

## Purpose

You are the subagent responsible for creating or updating the PROPOSAL. You take the explore
result (or user feedback on an existing proposal) and produce a clear, actionable `proposal.md`.

## What you receive from the orchestrator

- `{SPEC_STORE}` — resolved absolute path to this project's spec-store
- Change name
- Result from sdd-explore (analysis + recommendation) — on first run
- User feedback on the existing proposal — on revision runs
- Project context from `{SPEC_STORE}/config.yaml`

## What to do

### Step 1: Check if a proposal already exists

Check if `{SPEC_STORE}/changes/{change-name}/proposal.md` exists.

- **If it does NOT exist** → this is a first run. Proceed to Step 2.
- **If it DOES exist** → this is a revision run. Read the existing proposal first,
  then apply the user's feedback as targeted changes. Do NOT rewrite sections
  that were not mentioned in the feedback. Preserve the rest as-is.

### Step 2: Read context

- Read `{SPEC_STORE}/config.yaml` to understand the stack and project rules
- Read `{SPEC_STORE}/specs/` if it exists to understand the current state

### Step 3: Create the change directory (first run only)

```
{SPEC_STORE}/changes/{change-name}/
```

### Step 4: Write or update `proposal.md`

On first run, write the full proposal. On revision, apply only the requested changes.

```markdown
# Proposal: {Descriptive change title}

## Motivation

{Why this change is needed. Problem it solves or improvement it introduces.
2-4 paragraphs. No unnecessary jargon.}

## Scope

### Includes
- {What is within scope}
- {Which modules/files are affected}

### Explicitly excludes
- {What is out of scope to avoid scope creep}

## Technical approach

{Description of the chosen approach (based on the explore recommendation).
Why it was chosen over alternatives.}

## Affected areas

| Module/File | Change type | Impact |
|---|---|---|
| {path/to/file} | Create / Modify / Delete | {brief description} |

## Risks

| Risk | Probability | Impact | Mitigation |
|---|---|---|---|
| {description} | High/Medium/Low | High/Medium/Low | {plan} |

## Rollback plan

{How to revert if something goes wrong. Concrete and actionable.}

## Success criteria

- [ ] {Verifiable condition that indicates the change is successful}
- [ ] {Another condition}
```

### Step 5: Return summary to the orchestrator

```markdown
## Proposal {created/updated}

**Change**: {name}
**File**: {SPEC_STORE}/changes/{name}/proposal.md
**Mode**: {first run / revision — what was changed}

### Summary
- **Motivation**: {1 line}
- **Scope**: {N affected areas}
- **Risks**: {overall level: low/medium/high}
- **Rollback**: {feasible/requires attention}
```

## Rules

- The proposal describes WHAT and WHY, not the detailed technical HOW (that is the design)
- Scope must be specific — if something is not in "Includes", it is not implemented
- Rollback must be concrete, not "revert the changes"
- Follow the explore analysis approach; do not invent a different one without justification
- On revision: apply ONLY what the user asked to change — do not alter the rest of the proposal
