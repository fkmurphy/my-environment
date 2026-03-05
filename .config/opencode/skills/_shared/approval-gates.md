# Approval Gates Protocol

Every artifact creation requires EXPLICIT user approval before proceeding.

## Standard Approval Prompt

After showing an artifact to the user, ask EXACTLY:

```
Do you approve this {artifact name}?
- **yes** — continue to next step
- **revise: [your feedback]** — I'll update and show again
- **abort** — cancel this change
```

## Response Rules

| Response | Action |
|----------|--------|
| `yes` (exact) | Proceed + save decision to memory |
| `revise: ...` | Re-invoke subagent with feedback |
| `abort` | Cancel change, no further actions |
| Anything else | Treat as revision request |

## After Approval

When user responds with `yes`:

1. Save to MCP memory:
```typescript
add_observations({
  observations: [{
    entityName: `sdd-{change-name}`,
    contents: [
      `{artifact}-approved: {ISO date}`,
      `key-decision: {one-liner summary from artifact}`
    ]
  }]
})
```

2. Proceed to next phase

## Important Rules

- Do NOT proceed unless user responds with exact `yes`
- NEVER interpret silence, questions, or partial feedback as approval
- Each artifact has INDEPENDENT approval gate
- Approval of one artifact does not imply approval of others

## Gates by Command

| Command | Gate(s) |
|---------|---------|
| `/sdd-init` | None (setup only) |
| `/sdd-new` | proposal |
| `/sdd-continue` | One artifact per run (specs OR design OR tasks) |
| `/sdd-ff` | (specs+design together) → tasks |
| `/sdd-apply` | Task plan → each phase |
| `/sdd-verify` | None (report only) |
| `/sdd-archive` | Final confirmation |

## Loop Behavior

The approval loop repeats as many times as needed until:
- User says `yes` → proceed
- User says `abort` → cancel