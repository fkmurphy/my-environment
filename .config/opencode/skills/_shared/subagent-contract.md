# Subagent Result Contract

All SDD subagents return structured payloads to the orchestrator.

## Format

```json
{
  "status": "ok | warning | blocked | failed",
  "summary": "1-line decision-grade summary",
  "artifacts": [
    {
      "name": "proposal",
      "mode": "mcp-memory | filesystem | none",
      "ref": "sdd-{change}-proposal | {file-path} | null"
    }
  ],
  "next_recommended": ["specs", "design"],
  "risks": ["optional list of risks"]
}
```

## Status Meanings

| Status | Meaning | Orchestrator Action |
|--------|---------|---------------------|
| `ok` | Completed successfully | Proceed to next step |
| `warning` | Completed with caveats | Show warning, proceed |
| `blocked` | Cannot proceed | Ask user for input |
| `failed` | Error occurred | Report error, stop |

## Fields

### `status` (required)

One of: `ok`, `warning`, `blocked`, `failed`

### `summary` (required)

Single line, decision-grade. Example:
- "Created proposal for dark mode with system preference detection"
- "Specs written for 3 domains, 12 scenarios total"
- "Blocked: missing database migration for new table"

### `artifacts` (required)

Array of created/modified artifacts. Each has:
- `name`: artifact type (proposal, spec, design, tasks, verify-report)
- `mode`: persistence mode used
- `ref`: entity name or file path

### `next_recommended` (optional)

Array of recommended next steps. Example:
- `["specs", "design"]` after proposal
- `["tasks"]` after specs + design
- `["apply"]` after tasks

### `risks` (optional)

Array of identified risks. Example:
- `["Large menu may cause timeout", "Special chars need UTF-8 BOM"]`

## Example Returns

### Successful proposal
```json
{
  "status": "ok",
  "summary": "Created proposal for CSV export with CLI script approach",
  "artifacts": [
    {"name": "proposal", "mode": "mcp-memory", "ref": "sdd-csv-export-proposal"}
  ],
  "next_recommended": ["specs", "design"],
  "risks": ["Large datasets may cause memory issues"]
}
```

### Blocked
```json
{
  "status": "blocked",
  "summary": "Cannot create tasks: design.md has open questions",
  "artifacts": [],
  "next_recommended": [],
  "risks": ["Design pending decision on caching strategy"]
}
```

## Orchestrator Responsibilities

1. Show `summary` to user
2. Track `artifacts` for state management
3. Consider `next_recommended` for flow suggestions
4. Display `risks` if present
5. Handle `status` appropriately