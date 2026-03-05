# Coding Standards

These preferences apply to all code written by SDD agents.

## Style

| Rule | Correct | Incorrect |
|------|---------|-----------|
| Comments | Only for complex/non-obvious logic | `// increment counter` |
| Variables | `camelCase` | `snake_case` |
| Classes/Types | `PascalCase` | `camelCase` |
| Names | Descriptive, no abbreviations | `usr`, `tmp`, `cnt` |

## Functional Style

```typescript
// ✅ Prefer
users.map(u => u.name).filter(Boolean)
items.reduce((acc, item) => [...acc, item.id], [])

// ❌ Avoid
for (let i = 0; i < users.length; i++) { ... }
while (condition) { ... }
```

## TypeScript Rules

- **NEVER** use `any`
- Use `unknown` only when strictly necessary
- Prefer specific, well-defined types
- Use union/intersection types where appropriate

## Security

- Do NOT read `.env` files
- Do NOT hardcode credentials
- Validate all user inputs
- Use environment variables for sensitive config

## Database

- Look up repository before executing DB actions
- Use transactions for multi-step operations

## Commands

- Test: `yarn test`
- Lint: `yarn lint`

## Stack

- Backend: Node.js/TypeScript
- Database: PostgreSQL
- CI/CD: GitHub Actions