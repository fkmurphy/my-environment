---
name: lara-code-style
description: Code style guide, architecture patterns, available commands, and project conventions for the Lara TypeScript microservices platform (@meetlara). Use when working on any Lara service or when asked about code standards, project structure, or available scripts.
license: MIT
compatibility: opencode
metadata:
  project: lara
  language: typescript
---

# Lara Code Style & Architecture Guide

## Project Overview

Lara is an AI-powered helpdesk/HR assistant platform built as a collection of independent TypeScript microservices under the `@meetlara` organization. Each service is a separate git repository living side by side in `~/dev/lara/`.

## Services

| Service | Purpose |
|---------|---------|
| `chat-service` | Core AI chat/helpdesk (LangChain/LangGraph + Azure OpenAI) |
| `mcp-service` | Model Context Protocol integrations |
| `ticket-service` | Ticket management |
| `employee-service` | Employee data management |
| `scheduler-service` | Cron/scheduling |
| `notification-service` | Email/notification delivery |
| `dashboard-service` | Analytics dashboard (back + React front) |
| `case-service` | Case management |
| `file-employee-integration-service` | File-based employee data integrations |
| `backoffice-service` | Admin backoffice UI (React + Vite + MUI) |
| `js-utils` | Shared TypeScript utility packages (Lerna monorepo, `@alanszp/*`) |

## Tech Stack

### Backend
- **Runtime**: Node.js 20/22 with TypeScript
- **Package manager**: Yarn
- **HTTP framework**: Express v4 with TSOA (auto-generates routes and OpenAPI spec)
- **ORM**: TypeORM v0.2-0.3
- **Database**: PostgreSQL (primary), Redis (caching)
- **AI**: LangChain/LangGraph with Azure OpenAI (`@langchain/openai`, `@langchain/mcp-adapters`)
- **Validation**: Zod
- **Config**: Convict
- **Testing**: Jest
- **Monitoring**: NewRelic, LangSmith
- **Infrastructure local**: Docker Compose (PostgreSQL, Redis, LocalStack para S3/EventBridge)

### Frontend (backoffice-service/front)
- **Framework**: React 18 + TypeScript
- **Build tool**: Vite
- **UI library**: Material UI (MUI) v5
- **State management**: Redux Toolkit
- **Routing**: React Router v6
- **Forms**: Formik + Yup
- **i18n**: i18next
- **HTTP**: Axios

### Shared Libraries (js-utils `@alanszp/*`)
`access-list`, `audit`, `axios-node`, `core`, `errors`, `eventbridge-client`, `express`, `jwt`, `logger`, `queue`, `shared-context`, `typeorm`, `validations`, and more.

## Directory Structure (per TypeScript backend service)

```
<service>/
├── .github/workflows/     # GitHub Actions CI/CD
├── back/
│   ├── src/
│   │   ├── api/           # Express routes (TSOA controllers)
│   │   ├── lib/           # Business logic, domain services
│   │   ├── workers/       # Background job processors
│   │   ├── test/          # Jest tests (unit + integration)
│   │   └── types/         # TypeScript type definitions
│   ├── .eslintrc.js
│   ├── .prettierrc
│   ├── .editorconfig
│   ├── tsconfig.json
│   └── Dockerfile
├── db/                    # SQL migration scripts
└── deploy/                # Docker Compose for local deployment
```

## Available Commands (per backend service, run inside `back/`)

```bash
yarn dev              # Start development server (JSON logs via jq)
yarn dev-worker       # Start background worker in dev mode
yarn dev-raw          # Dev server without log formatting
yarn build            # Compile TypeScript (tsc && tsc-alias)
yarn start            # Production start (node -r newrelic dist/api/index.js)
yarn start-worker     # Production worker start
yarn lint             # ESLint + tsc --noEmit
yarn test             # Run all Jest tests
yarn test-unit        # Unit tests only
yarn test-integration # Integration tests only
yarn test-ci          # CI suite (unit + integration)
yarn format           # Run bin/format.sh
yarn validate         # lint + test + build
yarn typeorm          # TypeORM CLI for migrations
yarn docs-dev         # Auto-generate TSOA OpenAPI spec on file change
yarn build-tsoa       # Generate TSOA routes and spec
```

## `lara` CLI

The `lara` command is a bash CLI dispatcher for the local Docker environment, available from `~/dev/lara/docker/lara`.

```bash
lara init             # Initialize local environment
lara global           # Global Docker operations
lara chat             # chat-service
lara case             # case-service
lara employee         # employee-service
lara dashboard        # dashboard-service
lara notification     # notification-service
lara queue-monitor    # Queue monitor
lara file             # file-employee-integration-service
lara scheduler        # scheduler-service
lara mcp              # mcp-service
lara l10              # Localization
lara jwt              # JWT utilities
```

## Code Style

### TypeScript Conventions (All Platforms)

- **camelCase** for variables, functions, and file names
- **PascalCase** for classes, types, interfaces, and enums
- **Named exports only** — no default exports (`import/no-default-export: error`)
- **No `any` type** — use specific types or `unknown` only when strictly necessary
- **No comments** unless the logic is genuinely complex or non-obvious
- **Functional programming preferred**: use `map`, `filter`, `reduce`, `forEach` — avoid `for`, `while`, `do-while`
- **Unused variables**: prefix intentionally unused args with `_`

### ESLint Configuration

Extends: `airbnb-typescript/base`, `@typescript-eslint/recommended`, `@typescript-eslint/recommended-requiring-type-checking`, `prettier`, `unicorn`, `jest`, `promise`

Key rules:
- `import/no-default-export: error`
- `unicorn/filename-case`: camelCase or PascalCase
- `unicorn/prevent-abbreviations: off`
- `unicorn/no-array-for-each: off`
- `unicorn/no-null: off`
- `curly: ["error", "multi-line"]`
- `require-await: error` (in most backend services)

### Prettier

```json
{
  "tabWidth": 2,
  "useTabs": false,
  "printWidth": 120,
  "trailingComma": "es5"
}
```

### TypeScript Config

- Target: ES2022, Module: Node16 (backend) / ESNext (frontend)
- Strict mode enabled
- Decorators enabled in backend (`emitDecoratorMetadata`, `experimentalDecorators`)
- Path alias: `@/*` → `src/*`
- `strictPropertyInitialization: false` (for TypeORM entities in backend)

### EditorConfig

- Indent: 2 spaces
- End of line: LF
- Charset: UTF-8
- Trim trailing whitespace
- Insert final newline

## Backend Patterns & Architecture

### Repository Pattern
All database operations go through repositories. Place repositories in `src/lib/<domain>/`.

```typescript
export class TicketRepository {
  constructor(private readonly dataSource: DataSource) {}

  async findById(id: string): Promise<Ticket | null> {
    return this.dataSource.getRepository(Ticket).findOne({ where: { id } });
  }
}
```

### Controllers (TSOA)
Use TSOA decorators for route definition — routes are auto-generated, no manual Express router setup.

```typescript
import { Controller, Get, Route, Tags } from "tsoa";

@Route("tickets")
@Tags("Tickets")
export class TicketController extends Controller {
  @Get("{id}")
  async getTicket(id: string): Promise<TicketResponse> { ... }
}
```

### Services / Business Logic
Place in `src/lib/`. Use dependency injection via constructors. Apply repository pattern for DB access.

```typescript
export class TicketService {
  constructor(private readonly ticketRepository: TicketRepository) {}

  async findById(id: string): Promise<Ticket> {
    return this.ticketRepository.findById(id);
  }
}
```

### TypeORM Entities
Entities live in `src/lib/<domain>/`. Use decorators. `strictPropertyInitialization` is disabled.

```typescript
@Entity("tickets")
export class Ticket {
  @PrimaryGeneratedColumn("uuid")
  id: string;

  @Column()
  title: string;

  @CreateDateColumn()
  createdAt: Date;
}
```

### Workers
Background jobs live in `src/workers/`. Started separately via `yarn dev-worker` / `yarn start-worker`.

### Tests
- Unit tests: `src/test/unit/`
- Integration tests: `src/test/integration/`
- Framework: Jest
- Run: `yarn test-unit`, `yarn test-integration`, `yarn test-ci`

## Frontend Patterns & Architecture

### Directory Structure (backoffice-service/front)

```
front/
├── src/
│   ├── pages/            # Page components (one per route)
│   ├── features/         # Feature slices (Redux Toolkit, components, hooks)
│   │   ├── <feature>/
│   │   │   ├── slices/   # Redux Toolkit slices
│   │   │   ├── hooks/    # Custom hooks (useFeature, etc.)
│   │   │   ├── components/
│   │   │   ├── types.ts  # Feature-specific types
│   │   │   └── index.ts  # Exports
│   ├── shared/           # Shared components, hooks, utilities
│   │   ├── components/
│   │   ├── hooks/
│   │   ├── types/
│   │   └── utils/
│   ├── store/            # Redux store setup
│   ├── api/              # Axios API clients
│   ├── i18n/             # i18next localization
│   ├── App.tsx
│   └── main.tsx
├── .eslintrc.cjs
├── vite.config.ts
└── tsconfig.json
```

### Redux Toolkit Slices
Organize Redux state by feature. Each feature has its own slice with actions and reducers.

```typescript
import { createSlice, PayloadAction } from "@reduxjs/toolkit";

interface TicketsState {
  items: Ticket[];
  loading: boolean;
  error: string | null;
}

const initialState: TicketsState = {
  items: [],
  loading: false,
  error: null,
};

export const ticketsSlice = createSlice({
  name: "tickets",
  initialState,
  reducers: {
    setLoading: (state, action: PayloadAction<boolean>) => {
      state.loading = action.payload;
    },
    setItems: (state, action: PayloadAction<Ticket[]>) => {
      state.items = action.payload;
    },
  },
});

export const { setLoading, setItems } = ticketsSlice.actions;
export default ticketsSlice.reducer;
```

### Custom Hooks
Extract logic into custom hooks for reusability. Hooks should use Redux selectors and dispatch.

```typescript
export const useTickets = () => {
  const dispatch = useDispatch();
  const { items, loading } = useSelector((state) => state.tickets);

  const fetchTickets = async () => {
    dispatch(setLoading(true));
    try {
      const data = await api.getTickets();
      dispatch(setItems(data));
    } finally {
      dispatch(setLoading(false));
    }
  };

  return { items, loading, fetchTickets };
};
```

### Components
- Keep components small and focused on presentation
- Pass data and handlers via props
- Use MUI components for UI
- Prefer functional components

```typescript
interface TicketItemProps {
  ticket: Ticket;
  onSelect: (id: string) => void;
}

export const TicketItem: React.FC<TicketItemProps> = ({ ticket, onSelect }) => {
  return (
    <Box onClick={() => onSelect(ticket.id)}>
      <Typography variant="h6">{ticket.title}</Typography>
      <Typography variant="body2" color="textSecondary">
        {ticket.description}
      </Typography>
    </Box>
  );
};
```

### Forms with Formik + Yup
Use Formik for form state and Yup for validation.

```typescript
import { useFormik } from "formik";
import * as yup from "yup";
import { TextField, Button, Box } from "@mui/material";

const validationSchema = yup.object({
  title: yup.string().required("Title is required"),
  description: yup.string(),
});

export const TicketForm: React.FC = () => {
  const formik = useFormik({
    initialValues: {
      title: "",
      description: "",
    },
    validationSchema,
    onSubmit: async (values) => {
      await api.createTicket(values);
    },
  });

  return (
    <Box component="form" onSubmit={formik.handleSubmit}>
      <TextField
        name="title"
        label="Title"
        value={formik.values.title}
        onChange={formik.handleChange}
        onBlur={formik.handleBlur}
        error={formik.touched.title && Boolean(formik.errors.title)}
        helperText={formik.touched.title && formik.errors.title}
      />
      <Button type="submit">Create</Button>
    </Box>
  );
};
```

### Routing with React Router
Define routes in App.tsx using `createBrowserRouter`.

```typescript
import { createBrowserRouter, RouterProvider } from "react-router-dom";

const router = createBrowserRouter([
  {
    path: "/",
    element: <Layout />,
    children: [
      { path: "tickets", element: <TicketsPage /> },
      { path: "tickets/:id", element: <TicketDetailPage /> },
    ],
  },
]);

export const App = () => {
  return <RouterProvider router={router} />;
};
```

### API Client (Axios)
Create a centralized Axios instance for API calls.

```typescript
import axios from "axios";

export const api = axios.create({
  baseURL: process.env.VITE_API_URL,
  timeout: 10000,
});

api.interceptors.response.use(
  (response) => response.data,
  (error) => {
    console.error("API Error:", error);
    throw error;
  }
);

export const ticketsApi = {
  getTickets: () => api.get<Ticket[]>("/tickets"),
  getTicket: (id: string) => api.get<Ticket>(`/tickets/${id}`),
  createTicket: (data: Partial<Ticket>) => api.post<Ticket>("/tickets", data),
};
```

### i18n Localization
Use i18next for multi-language support.

```typescript
import i18n from "i18next";

i18n.init({
  lng: "en",
  resources: {
    en: {
      translation: {
        "button.create": "Create",
        "button.delete": "Delete",
      },
    },
    es: {
      translation: {
        "button.create": "Crear",
        "button.delete": "Eliminar",
      },
    },
  },
});

export const useTranslation = () => i18n.t;
```

## Environment Variables

### Backend Services
Each backend service has:
- `back/.env.development` — local dev config
- `back/.env.test` — test config

Common variables across services:
- `DATABASE_URL` — PostgreSQL connection string
- `REDIS_URL` — Redis connection
- `AWS_*` — LocalStack credentials (region `us-east-1`, endpoint `http://localhost:4566`)
- `AZURE_OPENAI_API_KEY`, `AZURE_OPENAI_ENDPOINT`, `AZURE_OPENAI_API_VERSION` — AI services
- `LANGSMITH_API_KEY`, `LANGSMITH_PROJECT` — LangSmith tracing

### Frontend (backoffice-service/front)
- `.env.development` — local dev config
- `.env.production` — production config

Common variables:
- `VITE_API_URL` — Backend API base URL
- `VITE_APP_NAME` — Application name
- `VITE_ENABLE_ANALYTICS` — Analytics flag

## Infrastructure (local Docker)

Services are accessible via custom DNS at `*.meetlara.local`:
- `chats.meetlara.local` — chat-service
- `cases.meetlara.local` — case-service
- `employees.meetlara.local` — employee-service
- `dashboard.meetlara.local` — dashboard-service
- `mcp.meetlara.local` — mcp-service

Start local environment:
```bash
lara init     # First time setup
lara global   # Start shared infrastructure (PostgreSQL, Redis, LocalStack)
lara chat     # Start chat-service
```
