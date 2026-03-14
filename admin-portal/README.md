# Wellness Package System — Admin Portal

Next.js web app for **managing wellness packages**: create, list, edit, and delete packages. Talks to the backend **admin API** and uses React Query for server state, Zod for form validation, and shadcn-style UI components.

---

## Project structure

```
admin-portal/
├── src/
│   ├── app/
│   │   ├── layout.tsx           # Root layout: metadata, globals.css, ReactQueryProvider
│   │   └── page.tsx             # Home: renders PackagesPage
│   │
│   ├── components/
│   │   ├── providers/
│   │   │   └── query-client-provider.tsx   # TanStack Query client wrapper
│   │   └── ui/                  # shadcn-style primitives
│   │       ├── button.tsx
│   │       ├── checkbox.tsx
│   │       ├── dialog.tsx
│   │       ├── input.tsx
│   │       ├── label.tsx
│   │       ├── table.tsx
│   │       └── textarea.tsx
│   │
│   ├── domain/
│   │   └── wellness-package.ts  # Types: WellnessPackage, CreatePackagePayload, UpdatePackagePayload
│   │
│   ├── infrastructure/
│   │   └── api/
│   │       ├── api-types.ts    # ApiResponse<T>
│   │       ├── client.ts       # Axios instance, unwrapApiResponse, getApiErrorMessage
│   │       └── package-api.ts  # getPackages, createPackage, updatePackage, deletePackage
│   │
│   ├── features/
│   │   └── packages/
│   │       ├── index.ts        # Public exports (hooks, components, types)
│   │       ├── page/
│   │       │   └── packages-page.tsx   # Main page: table, create/edit/delete dialogs, usePackages
│   │       ├── hooks/
│   │       │   └── use-packages.ts     # React Query: list query + create/update/delete mutations
│   │       ├── schemas/
│   │       │   └── package-form.schema.ts   # Zod schema + PackageFormValues type
│   │       └── components/
│   │           ├── index.ts
│   │           ├── package-table.tsx
│   │           ├── package-form.tsx
│   │           ├── create-package-dialog.tsx
│   │           ├── edit-package-dialog.tsx
│   │           └── delete-package-dialog.tsx
│   │
│   └── lib/
│       └── utils.ts             # cn() (clsx + tailwind-merge)
│
├── .env.example                # NEXT_PUBLIC_API_URL
├── next-env.d.ts
├── package.json
├── tailwind / postcss / tsconfig (at repo root or in config files)
└── README.md
```

---

## Setup instructions

### Prerequisites

- **Node.js** (v18+ recommended)
- **npm** (or yarn / pnpm)
- Backend **admin API** running (e.g. `http://localhost:3001`)

### 1. Install dependencies

```bash
cd admin-portal
npm install
```

### 2. Environment variables

Create a `.env.local` (or use `.env`) and set the API base URL:

```bash
cp .env.example .env.local
```

| Variable | Description | Example |
|----------|-------------|---------|
| `NEXT_PUBLIC_API_URL` | Backend base URL (no trailing slash). Requests go to `{base}/api/admin/packages`. | `http://localhost:3001` |

If `NEXT_PUBLIC_API_URL` is unset, the app falls back to `http://localhost:3001` (see `src/infrastructure/api/client.ts`).

### 3. Run the app

**Development:**

```bash
npm run dev
```

Open [http://localhost:3000](http://localhost:3000) (or the port Next shows). The single page is the wellness package management screen.

**Production build:**

```bash
npm run build
npm run start
```

### 4. Lint

```bash
npm run lint
```

---

## API design

### Backend contract (admin API)

The portal uses the backend **admin** endpoints only:

- **Base URL:** `NEXT_PUBLIC_API_URL` (e.g. `http://localhost:3001`).
- **List:** `GET /api/admin/packages` → list of wellness packages.
- **Create:** `POST /api/admin/packages` → body: create payload; response: created package.
- **Update:** `PUT /api/admin/packages/:id` → body: update payload; response: updated package.
- **Delete:** `DELETE /api/admin/packages/:id` → no body; response: backend wrapper.

All responses are wrapped as `{ success, statusCode, message, data }`. The app uses `unwrapApiResponse()` to throw on non-success and return `data`.

### App-side API layer

- **Axios:** Single `apiClient` in `client.ts` with `baseURL` from env, `Content-Type: application/json`.
- **Types:** `ApiResponse<T>` in `api-types.ts` matches the backend wrapper; domain types in `domain/wellness-package.ts` (e.g. `price` as string to match backend decimal).
- **package-api.ts:** Thin functions that call `apiClient.get/post/put/delete` and `unwrapApiResponse(data)` so callers receive typed `data` or an error.
- **Errors:** `getApiErrorMessage(error)` in `client.ts` extracts a user-facing message from Axios errors or `response.data.message`.

The portal does **not** call the mobile API; it only uses the admin API.

---

## Architectural decisions

1. **Next.js App Router** — Single route: `app/page.tsx` renders `PackagesPage`. Layout wraps the app with `ReactQueryProvider` and global styles.
2. **Feature-based structure** — `features/packages` owns the page, hooks, schemas, and all package UI (table, form, create/edit/delete dialogs). Public API is via `features/packages/index.ts`.
3. **TanStack React Query** — List is a query (`getPackages`); create/update/delete are mutations. On mutation success, the list query is invalidated so the table refetches. Loading and error state come from the query and mutations.
4. **Domain types in one place** — `domain/wellness-package.ts` defines `WellnessPackage`, `CreatePackagePayload`, and `UpdatePackagePayload`; used by API, hooks, and components.
5. **Infrastructure vs domain** — API client and package-api live under `infrastructure/api`; they depend on domain types and expose functions used by the feature hook only (no direct API calls from UI).
6. **Zod for form validation** — `package-form.schema.ts` defines validation and `PackageFormValues`; `PackageForm` uses `safeParse` and displays field-level errors. Form values are strings (for inputs); conversion to API payload (e.g. number for price/duration) is in the form component.
7. **Controlled dialogs** — Create/Edit/Delete are modal dialogs; open state and selected package live in `PackagesPage`. Dialogs receive mutations and callbacks (e.g. `onOpenChange`, `onClose`, `onConfirm`) so the page stays the single source of truth.
8. **Shared form for create and edit** — `PackageForm` accepts optional `initialValues`; create dialog uses empty defaults, edit dialog passes the selected package. Submit handler maps form values to create/update payload and calls the appropriate mutation.
9. **shadcn-style UI** — Reusable components under `components/ui` (Button, Dialog, Input, Table, etc.) with Tailwind and `cn()` for class merging; used by the packages feature.
10. **Client components** — Page, hooks, and feature components use `"use client"` because they use React Query, useState, and event handlers; layout and root page are server components where applicable.

---

## Assumptions made

- **Backend admin API** is running and reachable at `NEXT_PUBLIC_API_URL`; no authentication is implemented (same as backend README). CORS must allow the portal origin if it differs from the API.
- **API base URL** is the backend root (e.g. `http://localhost:3001`); paths like `/api/admin/packages` are appended by the app. No `/api/admin` prefix is assumed in the env value.
- **Package model** matches backend: `id`, `name`, `description` (optional), `price` (string), `duration_minutes` (number), `created_at` (string), `available` (boolean). Create/update payloads use number for price and duration.
- **Single page app** — No other routes or navigation; the only screen is the package management page. No auth flow, no deep links.
- **Errors** — Network and API errors are shown inline (e.g. banner or dialog); list query and mutations expose `error` and use `getApiErrorMessage` for display. No global error boundary is documented.
- **Stale-while-revalidate** — After create/update/delete, the list is invalidated and refetched; no optimistic updates or local cache merge.
- **Form behavior** — Create dialog closes on successful create; edit/delete close on success or cancel. No unsaved-changes warning.
- **Browser only** — Built for browser use; `NEXT_PUBLIC_*` is required for client-side API base URL. Server-side rendering of the page does not depend on API data for initial HTML (data loads in client after mount).

---

## Quick reference

| Task | Command |
|------|--------|
| Install | `npm install` |
| Dev server | `npm run dev` |
| Build | `npm run build` |
| Start (prod) | `npm run start` |
| Lint | `npm run lint` |
