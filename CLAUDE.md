# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

ASP.NET Core Web API (.NET 10.0) example project with Docker and Kubernetes (Helm) deployment support. Uses the minimal hosting model with all endpoints defined directly in `Program.cs`.

## Build & Development Commands

```bash
dotnet build                          # Build the project
dotnet run --environment Development  # Run locally (port 8080, Swagger enabled)
dotnet format --verify-no-changes --severity error  # Check formatting (used in CI)
dotnet test --no-restore --configuration Release     # Run tests
```

**Makefile shortcuts:**
```bash
make dist          # Build the application
make image         # Build Docker image
make run           # Run Docker container
make run-app-dev-mode  # Run in Development mode
make up            # Build + image + run
```

## Architecture

Single-file API (`Program.cs`) with three endpoints:
- `GET /` — Info/health JSON response
- `GET /probe/live` — Kubernetes liveness probe
- `GET /probe/ready` — Kubernetes readiness probe

Swagger/OpenAPI is enabled only in Development environment. The app listens on port 8080.

## Deployment

- **Docker:** Multi-stage build (SDK for build, aspnet runtime for final image)
- **Kubernetes:** Helm chart in `deployment/k8s/helm/chart/` with Service, Deployment, optional Ingress and HPA
- **CI/CD:** GitHub Actions (`.github/workflows/build.yaml`) — restores, format-checks, builds, tests, and pushes Docker image on main branch pushes

## Key Configuration

- `appsettings.json` / `appsettings.{Development,Production}.json` — environment-specific config
- `Properties/launchSettings.json` — local dev profiles
- Environment variables: `ASPNETCORE_URLS=http://*:8080`, `DOTNET_ENVIRONMENT`
