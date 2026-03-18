# Wellness Package System — Mobile App

Flutter app for **browsing wellness packages**. Uses **GetX** for navigation + DI, **Dio/Retrofit** for networking, and a small **local cache (Hive + encryption)** as a fallback when the network fails.

---

## Project structure

```
mobile-app/
├── assets/
│   └── environments/
│       ├── .env.dev
│       ├── .env.staging
│       └── .env.prod
│
├── lib/
│   ├── main.dev.dart               # Dev entrypoint (loads .env.dev)
│   ├── main.staging.dart           # Staging entrypoint (loads .env.staging)
│   ├── main.dart                   # Prod entrypoint (loads .env.prod)
│   ├── initilizer.dart             # Global initializer (Hive + logger + orientation)
│   ├── di.dart                     # Global DI (ApiClient, interceptors, managers)
│   │
│   ├── app/
│   │   ├── app.dart                # GetMaterialApp, themes, routes, translations
│   │   ├── initializer.dart        # App-level init (modules)
│   │   ├── di.dart                 # App-level DI (modules)
│   │   ├── routes/
│   │   │   └── app_pages.dart       # Route aggregation (Main + Package)
│   │   └── modules/
│   │       ├── main/               # Splash + app bootstrap routes
│   │       └── package/            # Packages feature (Clean-ish layering)
│   │           ├── data/
│   │           │   ├── data_sources/
│   │           │   │   ├── network_manager/          # Retrofit interfaces
│   │           │   │   ├── storage_manager/          # Hive storage helpers
│   │           │   │   ├── package_remote_data_source.dart
│   │           │   │   └── package_local_data_source.dart
│   │           │   └── repositories/                 # Repo implementation
│   │           ├── domain/
│   │           │   ├── entities/                     # Freezed models (JSON)
│   │           │   └── usecases/                     # Orchestrates repository calls
│   │           ├── presentation/
│   │           │   ├── list/                         # Controller + view
│   │           │   └── widgets/                      # UI components (atoms/molecules)
│   │           ├── di.dart                           # Feature DI wiring
│   │           └── initializer.dart                  # Feature storage init (Hive box)
│   │
│   └── core/
│       ├── config/                    # AppConfig (flavor + env values)
│       ├── networking/                # Dio base client + interceptors
│       ├── exceptions/                # Network/cache exception types
│       ├── failure/                   # Failures used by repositories
│       ├── services/                  # Auth token manager, connectivity checks, etc.
│       ├── ui/                        # Themes, colors, shared widgets
│       ├── utils/                     # Encryption, logging, helpers
│       └── values/                    # Flavor, app state enums, constants
│
├── pubspec.yaml
└── README.md
```

---

## Setup instructions

### Prerequisites

- **Flutter SDK** (matches `environment.sdk` in `pubspec.yaml` — currently Dart `^3.11.0`)
- **Xcode** (for iOS builds) and/or **Android Studio** (for Android builds)
- A running backend that serves the **mobile API** (see API section below)

### 1. Install dependencies

```bash
cd mobile-app
flutter pub get
```

### 2. Environment variables

The app loads environment variables from assets:

- Dev: `assets/environments/.env.dev`
- Staging: `assets/environments/.env.staging`
- Prod: `assets/environments/.env.prod`

Required keys (used by the app today):

| Key | Description | Example |
|-----|-------------|---------|
| `APP_NAME` | App name shown in the UI. | `Wellness Package - DEV` |
| `API_BASE_URL` | Backend base URL (no trailing slash). | `http://10.0.2.2:3000` |
| `CONNECTION_CHECKER_URL` | Hostname used for `InternetAddress.lookup(...)`. | `google.com` |
| `STORAGE_KEY` | Symmetric key used by the encryption helper. | `my32lengthsupersecretnooneknows1` |

Notes:

- `10.0.2.2` is the special **Android emulator** host loopback. On iOS simulator use `http://localhost:<port>`; on a real device use your machine’s LAN IP.
- `CONNECTION_CHECKER_URL` must be a resolvable host (the current default in env files is empty, so connectivity checks will fail until set).

### 3. Run the app (by flavor)

```bash
# Dev
flutter run -t lib/main.dev.dart

# Staging
flutter run -t lib/main.staging.dart

# Prod
flutter run -t lib/main.dart
```

### 4. Generate code (Retrofit / Freezed / JSON)

This project uses generators (e.g. Retrofit + Freezed). If you change annotated models or Retrofit interfaces, regenerate:

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

---

## API design

### Backend contract (mobile API)

The mobile app currently calls:

- **Base URL:** `API_BASE_URL` from the env file (wired into `AppConfig.apiBaseUrl`)
- **List packages:** `GET /api/mobile/packages`

The response is expected to be wrapped like:

```json
{
  "success": true,
  "statusCode": 200,
  "message": "OK",
  "data": [
    {
      "id": "uuid",
      "name": "Deep Tissue Massage",
      "description": "…",
      "price": "120.00",
      "duration_minutes": 60,
      "created_at": "2026-03-18T00:00:00.000Z",
      "available": true
    }
  ]
}
```

### App-side API layer

- **HTTP client**: `Dio` via `ApiClient` (`lib/core/networking/api_client.dart`) with default JSON headers and `validateStatus: (status) => status < 300`.
- **Interceptors**: `ApiInterceptor` adds `Authorization: Bearer <token>` if an access token exists and the request is not `login`. In dev/staging it also enables a cURL logger interceptor for easier debugging.
- **Retrofit**: `PackageNetworkManager` (`lib/app/modules/package/data/data_sources/network_manager/package_network_manager.dart`) defines the endpoint and returns a typed `GetPackageResponse`.
- **Models**: Freezed + `json_serializable` entities under `lib/app/modules/package/domain/entities/` map JSON fields like `duration_minutes` → `durationMinutes`.
- **Repository behavior**: `PackageRepositoryImpl` fetches remote data, caches it locally (Hive), and on network errors returns cached data alongside a failure object.

---

## Architectural decisions

1. **Flavor entrypoints** — Separate mains (`main.dev.dart`, `main.staging.dart`, `main.dart`) load different `.env.*` files and register `AppConfig` in GetX.
2. **GetX as the backbone** — GetX provides DI (`Get.put`, `Get.lazyPut`), routing (`GetPage`), and state observation (`Obx`) without additional boilerplate.
3. **Feature modules** — Code is organized by feature under `lib/app/modules/<feature>`; each module owns its data/domain/presentation layers plus `di.dart` + `initializer.dart`.
4. **Clean-ish layering** — Presentation depends on repositories/usecases; repositories depend on data sources; data sources depend on Retrofit/Dio and local storage. Domain entities stay in `domain/entities`.
5. **Dio + Retrofit** — Retrofit generates the strongly-typed network layer, while `ApiClient` owns base options and shared interceptors.
6. **Local caching via Hive** — Packages are cached in a Hive box (feature initializer opens it) and stored encrypted; repository uses cache as a fallback when remote calls fail.
7. **Single source of config** — `AppConfig` holds `apiBaseUrl`, flavor, and other env-backed settings; most services read from `AppConfig.instance`.

---

## Assumptions made

- **Backend availability**: A backend is running and reachable at `API_BASE_URL`, and it exposes `GET /api/mobile/packages`.
- **Response wrapper**: The backend wraps responses as `{ success, statusCode, message, data }` and the mobile entities match those shapes.
- **Price type**: `price` is treated as a **string** in the mobile model (to match backend decimal/string behavior).
- **Connectivity checks**: `CONNECTION_CHECKER_URL` must be set to a valid hostname; otherwise `NetworkInfoManager.isConnected()` will always fail.
- **Auth token usage**: If tokens are stored in the `auth` Hive box, requests (except those containing `login`) will include `Authorization: Bearer <token>`. There is no full sign-in flow documented yet (interceptor sign-out navigation is currently stubbed).
- **Caching**: Cache is a fallback for error cases; there’s no explicit staleness policy or cache invalidation beyond overwriting on successful fetch.

---

## Quick reference

| Task | Command |
|------|--------|
| Install deps | `flutter pub get` |
| Run (dev) | `flutter run -t lib/main.dev.dart` |
| Run (staging) | `flutter run -t lib/main.staging.dart` |
| Run (prod) | `flutter run -t lib/main.dart` |
| Codegen | `flutter pub run build_runner build --delete-conflicting-outputs` |
