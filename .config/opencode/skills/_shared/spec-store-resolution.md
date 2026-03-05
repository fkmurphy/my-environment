# Spec-Store Resolution

All SDD artifacts are stored OUTSIDE the project repo to avoid accidental commits.

## Resolution Order

Before ANY SDD operation, resolve `{SPEC_STORE}`:

1. Check if `.spec/spec-config.yaml` exists in project root
2. If exists → read `store:` value
   - Resolve `~` to home directory
   - Resolve relative paths against project root
3. If not exists → use default:
   ```
   ~/.config/opencode/spec-store/{project-name}/
   ```
   Where `{project-name}` = `basename($PWD)`

## Pass to Subagents

The resolved `{SPEC_STORE}` path MUST be passed to EVERY subagent invocation.

Example:
```
{SPEC_STORE}: /Users/user/.config/opencode/spec-store/my-project
```

## Git Safety

When running `/sdd-init`, the `.gitignore` must include:
```
.spec/
!.spec/spec-config.yaml
```

## Safe to Commit

`.spec/spec-config.yaml` is the ONLY file in `.spec/` that belongs in the repo.

Example:
```yaml
# .spec/spec-config.yaml
store: ~/.config/opencode/spec-store/my-project
```

Contains no secrets — just a path override for team sharing.

## Project Context

After resolving `{SPEC_STORE}`, read project config:

```
{SPEC_STORE}/config.yaml
```

This contains:
- Detected stack
- Test/lint commands
- Project-specific rules