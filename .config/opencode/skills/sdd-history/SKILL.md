---
name: sdd-history
description: >
  Search SDD decisions in memory.
---

# History Searcher

## Arguments

User may provide:
- Topic to search
- Change name
- Just run `/sdd-history` for all

## What to do

### Step 1: Search memory

```typescript
search_nodes({ query: query || "sdd-" })
```

### Step 2: Get full content

```typescript
open_nodes({ names: [matching entity names] })
```

### Step 3: Format output

```
SDD History — {query}

═══════════════════════════════════════════════════════

Found 3 matches for "auth":

┌─────────────────────────────────────────────────────┐
│ sdd-add-oauth (archived 2026-02-15)                │
├─────────────────────────────────────────────────────┤
│ Project: chat-service                               │
│ Decision: Use JWT with RS256 signing               │
│ Files: src/auth/jwt.ts, src/middleware/auth.ts     │
│                                                     │
│ Key observations:                                   │
│ • proposal-approved: 2026-02-14                    │
│ • key-decision: OAuth 2.0 over custom auth         │
└─────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────┐
│ sdd-fix-auth-bug (archived 2026-02-10)             │
├─────────────────────────────────────────────────────┤
│ Project: chat-service                               │
│ Decision: Rate limit by IP + user ID               │
│                                                     │
│ Key observations:                                   │
│ • key-decision: Add rateLimiter middleware         │
└─────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────┐
│ sdd-auth-refactor (active)                         │
├─────────────────────────────────────────────────────┤
│ Project: chat-service                               │
│ Status: In design phase                             │
│                                                     │
│ Current: Migrating to OAuth 2.0                    │
└─────────────────────────────────────────────────────┘

═══════════════════════════════════════════════════════

Tip: Use /sdd-history {change-name} for specific change.
```

## Search Patterns

| Query | Returns |
|-------|---------|
| `sdd-` | All SDD entities |
| `auth` | Entities mentioning auth |
| `sdd-add-oauth` | Specific change |
| `archived` | All archived changes |

## Rules

- Default: search all `sdd-` entities
- Show key decisions prominently
- Include dates and project
- Distinguish active vs archived