# Persistence Contract (shared across all SDD skills)

## Mode Resolution

The orchestrator passes `persistence_mode` with one of: `mcp-memory | filesystem | none`.

Default resolution (when not explicitly set):

1. If MCP memory is available → use `mcp-memory` (RECOMMENDED)
2. If user explicitly requests files → use `filesystem`
3. Otherwise → use `none`

`filesystem` is NEVER used by default — only when explicitly requested.

## Behavior Per Mode

| Mode | Read from | Write to | Project files |
|------|-----------|----------|---------------|
| `mcp-memory` | MCP memory tools | MCP memory tools | Never |
| `filesystem` | `{SPEC_STORE}/` | `{SPEC_STORE}/` | Yes |
| `none` | Orchestrator context | Nowhere | Never |

## MCP Memory Convention

All SDD artifacts persisted to MCP memory follow this naming:

```
Entity name: sdd-{change-name}-{artifact-type}
Entity type: sdd-artifact
Observations: [artifact content as separate strings]
```

### Artifact Types

| Type | Description |
|------|-------------|
| `proposal` | Change proposal |
| `spec` | Delta specifications |
| `design` | Technical design |
| `tasks` | Task breakdown |
| `apply-progress` | Implementation progress |
| `verify-report` | Verification report |

### Read Protocol (2 steps - MANDATORY)

```typescript
// Step 1: Search for entity
search_nodes({ query: `sdd-{change-name}-{artifact-type}` })

// Step 2: Get full content
open_nodes({ names: [`sdd-{change-name}-{artifact-type}`] })
```

NEVER use search results directly — they are truncated. ALWAYS call `open_nodes` for full content.

### Write Protocol

```typescript
create_entities({
  entities: [{
    name: `sdd-{change-name}-{artifact-type}`,
    entityType: "sdd-artifact",
    observations: [
      `created: {ISO date}`,
      `project: {project-name}`,
      // ... artifact content as separate observations
    ]
  }]
})
```

### Update Protocol

```typescript
add_observations({
  observations: [{
    entityName: `sdd-{change-name}`,
    contents: [
      `{artifact}-approved: {ISO date}`,
      `key-decision: {summary}`
    ]
  }]
})
```

## Common Rules

- If mode is `none`, return results inline only
- If mode is `mcp-memory`, do NOT write project files
- If mode is `filesystem`, write ONLY to `{SPEC_STORE}/` paths
- NEVER force filesystem creation unless explicitly requested
- Default to `mcp-memory` when available