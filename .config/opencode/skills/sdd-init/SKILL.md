---
name: sdd-init
description: >
  Bootstrap SDD spec-store for a project.
  Trigger: when orchestrator launches this subagent.
---

# Initializer

## Shared Conventions

Read first: `../_shared/persistence-contract.md`, `../_shared/spec-store-resolution.md`, `../_shared/subagent-contract.md`

## What you receive

- `{SPEC_STORE}` — resolved or default
- Project root path

## What to do

### Step 1: Detect stack

Check files:
- `package.json` → Node.js, test/lint
- `tsconfig.json` → TypeScript
- `go.mod` → Go
- `pyproject.toml` → Python
- `.github/workflows/` → CI
- Dependencies → ORM (prisma, typeorm)

### Step 2: Resolve spec-store

- Check `.spec/spec-config.yaml`
- Default: `~/.config/opencode/spec-store/{project}/`

### Step 3: Check existence

If `{SPEC_STORE}/config.yaml` exists → report, ask to overwrite.

### Step 4: Create structure

```
{SPEC_STORE}/
├── config.yaml
├── specs/
└── changes/
    └── archive/
```

### Step 5: Generate config

```yaml
schema: spec-driven
project: {name}
project-root: {absolute}

context: |
  Stack: {detected}
  Test: {command}
  Lint: {command}
  DB: {orm}
  CI: {platform}

rules:
  proposal:
    - Include rollback plan
    - Identify affected modules
  specs:
    - Use Given/When/Then
    - Use RFC 2119 keywords
  design:
    - Document decisions with rationale
  tasks:
    - Group by phases
  apply:
    - camelCase/PascalCase
    - Never use any
    - Prefer functional methods
  verify:
    - Run yarn test + yarn lint
  archive:
    - Warn on destructive merges
```

### Step 6: Create project config

`.spec/spec-config.yaml`:
```yaml
# SDD spec-store location. Safe to commit.
store: ~/.config/opencode/spec-store/{project}
```

Add to `.gitignore`:
```
.spec/
!.spec/spec-config.yaml
```

### Step 7: Save to memory

```typescript
create_entities({
  entities: [{
    name: `sdd-init-{project}`,
    entityType: "sdd-project",
    observations: [
      `initialized: {ISO date}`,
      `stack: {detected}`,
      `spec-store: {SPEC_STORE}`
    ]
  }]
})
```

### Step 8: Return

```json
{
  "status": "ok",
  "summary": "Initialized SDD for {project} with {stack}",
  "artifacts": [{"name": "config", "mode": "...", "ref": "..."}],
  "next_recommended": ["explore", "new"]
}
```

## Rules

- NO example specs — empty structure only
- Ask before overwriting
- Detect real stack
- config.yaml max 35 lines
- Only `.spec/spec-config.yaml` in repo
