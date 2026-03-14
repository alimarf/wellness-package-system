# Wellness Package System — Backend

NestJS API for managing wellness packages. Exposes **admin** (full CRUD) and **mobile** (read-only, available packages) APIs, with PostgreSQL via Prisma.

---

## Project structure

```
backend/
├── prisma/
│   ├── schema.prisma          # Prisma schema (WellnessPackage model)
│   └── migrations/            # Database migrations
├── generated/
│   └── prisma/                # Generated Prisma client (do not edit)
├── src/
│   ├── main.ts                # Bootstrap: CORS, validation, Swagger, response interceptor
│   ├── common/
│   │   ├── dto/
│   │   │   └── api-response.dto.ts      # Wrapper: { success, statusCode, message, data }
│   │   └── interceptors/
│   │       └── response.interceptor.ts  # Wraps all responses in ApiResponse
│   ├── prisma/
│   │   ├── prisma.module.ts
│   │   └── prisma.service.ts            # PrismaClient with pg adapter, connect/disconnect
│   └── modules/
│       ├── app.module.ts
│       ├── app.controller.ts             # Root GET /
│       ├── app.service.ts
│       └── wellness-package/
│           ├── wellness-package.module.ts
│           ├── controllers/
│           │   ├── admin.wellness-package.controller.ts   # /api/admin/packages
│           │   └── mobile.wellness-package.controller.ts  # /api/mobile/packages
│           ├── services/
│           │   └── wellness-package.service.ts
│           ├── repositories/
│           │   └── wellness-package.repository.ts
│           ├── mapper/
│           │   └── wellness-package-mapper.ts            # Entity → response DTO
│           └── dto/
│               ├── requests/
│               │   ├── create.wellness-package.request.dto.ts
│               │   └── update.wellness-package.request.dto.ts
│               └── responses/
│                   ├── get.wellness-package.response.dto.ts
│                   ├── create.wellness-package.response.dto.ts
│                   └── update.wellness-package.response.dto.ts
├── test/                       # E2E and unit tests
├── prisma.config.ts            # Prisma config (schema path, migrations, DATABASE_URL)
├── package.json
└── README.md
```

---

## Setup instructions

### Prerequisites

- **Node.js** (v18+ recommended)
- **PostgreSQL** (local or hosted)
- **npm** (or yarn/pnpm)

### 1. Install dependencies

```bash
cd backend
npm install
```

### 2. Environment variables

Copy the example env and set values:

```bash
cp .env.example .env
```

Edit `.env`:

| Variable       | Description                    | Example                    |
|----------------|--------------------------------|----------------------------|
| `NODE_ENV`     | `development` or `production`   | `development`              |
| `PORT`         | HTTP port (default: 3000)      | `3000`                     |
| `DATABASE_URL` | PostgreSQL connection string   | `postgresql://user:pass@localhost:5432/wellness` |

### 3. Database

Create the database, then run migrations and generate the Prisma client:

```bash
npx prisma migrate dev
```

Or, if you only need the client (e.g. DB already exists):

```bash
npx prisma generate
```

### 4. Run the app

```bash
# Development (watch mode)
npm run start:dev

# Production build then run
npm run build
npm run start:prod
```

The API is available at `http://localhost:3000` (or the port you set). In non-production, Swagger UI is at **http://localhost:3000/api/docs**.

### 5. Tests

```bash
npm run test           # Unit tests
npm run test:watch     # Watch mode
npm run test:cov       # With coverage
npm run test:e2e       # E2E tests
```

---

## API design

### Base URL and response format

- **Base URL:** `http://localhost:3000` (or your `PORT`)
- All JSON responses are wrapped by a global interceptor:

```json
{
  "success": true,
  "statusCode": 200,
  "message": "success",
  "data": { ... }
}
```

- Validation uses `class-validator`; invalid request bodies return 400 with validation errors.

### Admin API — `/api/admin/packages`

Full CRUD for wellness packages (for back-office/admin portal).

| Method | Path              | Description        | Body |
|--------|-------------------|--------------------|------|
| `POST` | `/api/admin/packages` | Create package     | `CreateWellnessPackageRequestDto` |
| `GET`  | `/api/admin/packages` | List all packages  | — |
| `GET`  | `/api/admin/packages/:id` | Get one by ID (UUID) | — |
| `PUT`  | `/api/admin/packages/:id` | Update package     | `UpdateWellnessPackageRequestDto` |
| `DELETE` | `/api/admin/packages/:id` | Delete package   | — |

**Create body (`CreateWellnessPackageRequestDto`):**

- `name` (string, required)
- `description` (string, optional, nullable)
- `price` (number, required, ≥ 0)
- `duration_minutes` (number, required, ≥ 1)
- `available` (boolean, optional, default: true)

**Update body (`UpdateWellnessPackageRequestDto`):**

- Same fields as create, all optional (partial update).

**Response (single or list item):** `WellnessPackageResponseDto`

- `id`, `name`, `description`, `price` (string for decimal), `duration_minutes`, `created_at`, `available`

### Mobile API — `/api/mobile/packages`

Read-only API for mobile clients; returns only **available** packages.

| Method | Path              | Description                    |
|--------|-------------------|--------------------------------|
| `GET`  | `/api/mobile/packages` | List packages where `available === true` |
| `GET`  | `/api/mobile/packages/:id` | Get one by ID (UUID)       |

Response shape is the same `WellnessPackageResponseDto` as admin. A non-existent or unavailable package for `GET :id` returns 404.

### Root

- `GET /` — Simple root endpoint (e.g. health or welcome); response still wrapped in `ApiResponse`.

### Errors

- **404** — Package not found (e.g. invalid or missing UUID for `findOne`).
- **400** — Validation errors (missing/invalid body or path params).
- **500** — Unhandled server errors.

---

## Architectural decisions

1. **NestJS** — Modular structure, dependency injection, and built-in support for pipes, interceptors, and OpenAPI (Swagger).
2. **Separate admin vs mobile controllers** — Same domain service and repository; different routes and semantics (admin: full CRUD; mobile: read-only, filtered by `available`).
3. **Repository layer** — `WellnessPackageRepository` encapsulates Prisma calls; service stays free of DB details and deals only with DTOs and mapper.
4. **Mapper** — `WellnessPackageMapper` converts Prisma entities to response DTOs (e.g. `Decimal` → string for `price`) in one place.
5. **Global response interceptor** — Every response is wrapped in `{ success, statusCode, message, data }` for consistent client handling.
6. **Global ValidationPipe** — Request DTOs validated with `class-validator`; `whitelist: true` strips unknown properties.
7. **Prisma with PostgreSQL** — Schema in `prisma/schema.prisma`; client generated to `generated/prisma`; `PrismaService` uses `@prisma/adapter-pg` and `DATABASE_URL`.
8. **Swagger only in non-production** — API docs at `/api/docs` when `NODE_ENV !== 'production'` to avoid exposing docs in prod.
9. **CORS** — Configurable via `CORS_ORIGIN` (comma-separated); defaults to `localhost:3000` and `127.0.0.1:3000` if unset.

---

## Assumptions made

- **PostgreSQL** is the only supported database; connection is via `DATABASE_URL`.
- **Authentication/authorization** are not implemented; admin and mobile routes are unsecured. In production you would add guards (e.g. JWT, API key, or role-based) and possibly rate limiting.
- **IDs** are UUIDs; validation is done with `ParseUUIDPipe` on `:id` params.
- **Price** is stored as `Decimal(10, 2)` and exposed as a string in JSON to avoid precision issues.
- **Ordering** — List endpoints return packages ordered by `created_at` descending.
- **Soft delete** — Not used; `DELETE` performs a hard delete. If soft delete is needed later, an `deleted_at` (or similar) field and repository changes would be required.
- **Pagination** — Not implemented; `findAll` returns all matching records. Acceptable for small datasets; pagination (e.g. cursor or offset) can be added later.
- **Swagger** — Documented via DTO decorators (`@ApiProperty`, `@ApiPropertyOptional`); no separate OpenAPI file is maintained.
- **Root endpoint** — `GET /` is a simple app/health-style endpoint; no formal health-check path (e.g. `/health`) is defined.
- **Logging** — No structured request/response or error logging is configured; can be added with Nest Logger or a logging library.

---

## Quick reference

| Task              | Command              |
|-------------------|----------------------|
| Install           | `npm install`        |
| Dev server        | `npm run start:dev`  |
| Build             | `npm run build`      |
| Migrations        | `npx prisma migrate dev` |
| Generate client   | `npx prisma generate` |
| Unit tests        | `npm run test`       |
| Lint              | `npm run lint`       |
| Format            | `npm run format`     |
