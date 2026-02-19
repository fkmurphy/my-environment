# Lara Microservices Platform

This is the **Lara** AI-powered helpdesk/HR assistant platform — a collection of independent TypeScript microservices.

> **Code Style & Patterns**: Refer to the `lara-code-style` skill for all coding conventions, ESLint/Prettier configuration, architecture patterns, and project standards.

## Services

Each service is a separate git repository under `~/dev/lara/`:
- `chat-service` — Core AI chat/helpdesk (LangChain/LangGraph + Azure OpenAI)
- `ticket-service` — Ticket management
- `case-service` — Case management
- `employee-service` — Employee data management
- `scheduler-service` — Cron/scheduling
- `notification-service` — Email/notification delivery
- `dashboard-service` — Analytics dashboard (back + React front)
- `mcp-service` — Model Context Protocol integrations
- `file-employee-integration-service` — File-based employee data integrations
- `backoffice-service` — Admin backoffice UI (React + Vite + MUI)
- `js-utils` — Shared TypeScript utility packages (Lerna monorepo)

## Available Commands

For backend services (run inside `back/` or service root):
- `yarn dev` — Start development server
- `yarn dev-worker` — Start background worker
- `yarn build` — Compile TypeScript
- `yarn start` — Production start
- `yarn lint` — ESLint + type check
- `yarn test` — Run Jest tests
- `yarn validate` — lint + test + build
- `yarn format` — Run formatter
- `yarn typeorm` — TypeORM CLI
- `yarn docs-dev` — Auto-generate TSOA OpenAPI spec

## Local Docker Environment

Use the `lara` CLI from `~/dev/lara/docker/lara`:
```bash
lara init           # Initialize local environment
lara global         # Start shared infrastructure
lara chat           # Start chat-service
lara case           # Start case-service
lara employee       # Start employee-service
lara dashboard      # Start dashboard-service
```

Services are accessible at `*.meetlara.local` (e.g., `chats.meetlara.local`).

## When Working on Lara

1. Refer to the `lara-code-style` skill for coding conventions, patterns, and architecture
2. Run `yarn lint` and `yarn test` before committing
3. Use `yarn validate` (lint + test + build) to ensure everything passes before pushing

## Database Migrations

When running database migrations, you MUST know which service you're working in. Use the `lara` CLI with the service name and the `f` flag for Flyway.

**CRITICAL: ALWAYS RUN `pwd` FIRST**
Before suggesting a migration command, you MUST execute `pwd` to determine the current working directory and identify which service is being used. This ensures you run migrations on the correct service.

**SERVICE NAME MAPPING:**
The service name is extracted from the directory name by removing the `-service` suffix:
- `chat-service` → `chat`
- `case-service` → `case`
- `employee-service` → `employee`
- `dashboard-service` → `dashboard`
- `notification-service` → `notification`
- `scheduler-service` → `scheduler`
- `mcp-service` → `mcp`
- `ticket-service` → `ticket`
- `file-employee-integration-service` → `file`
- `backoffice-service` → `backoffice`

**WORKFLOW:**
1. Run: `pwd` to see the current directory
2. Extract the service name from the path (e.g., `/Users/jmurphy/dev/lara/chat-service` → `chat`)
3. Run: `lara <service> f migrate`

**Examples:**
- If `pwd` shows `/Users/jmurphy/dev/lara/chat-service` → Run: `lara chat f migrate`
- If `pwd` shows `/Users/jmurphy/dev/lara/case-service` → Run: `lara case f migrate`
- If `pwd` shows `/Users/jmurphy/dev/lara/employee-service` → Run: `lara employee f migrate`

The `f` flag stands for Flyway, the migration tool used in Lara services. Always execute migrations with this pattern.
