# PractiMentor — API Core

Servicio principal y autoridad del sistema: usuarios, roles, instituciones (multi-tenant), perfil profesional y recomendaciones. C# con ASP.NET Core (.NET 10), PostgreSQL y API REST documentada con OpenAPI.

Parte del proyecto **PractiMentor**, plataforma web de empleabilidad con inteligencia artificial para estudiantes universitarios (curso Herramientas de Desarrollo, UTP). Documentación y decisiones: [`practimentor-platform`](https://github.com/practimentor/practimentor-platform).

## Qué no le corresponde

No ejecuta modelos de lenguaje: delega en `practimentor-ai` las solicitudes ya autorizadas.

## Cómo ejecutarlo

```bash
dotnet restore
dotnet build
dotnet test
dotnet run    # GET /health
```

## Cómo contribuir

Lee [`CONTRIBUTING.md`](CONTRIBUTING.md).

## Integración continua

El workflow `.github/workflows/ci.yml` se ejecuta en cada Pull Request hacia `main` y en cada push a `main`. Restaura dependencias, compila con `-warnaserror` y ejecuta las pruebas. La rama `main` exige que el check `compilar-y-probar` pase antes de fusionar.

Para reproducirlo en local:

```bash
dotnet restore tests/Academic.Api.Tests
dotnet build Academic.Api.csproj --no-restore -warnaserror
dotnet test tests/Academic.Api.Tests
```

El workflow `cd.yml` se ejecuta al crear una etiqueta `v*`: construye la imagen Docker y la publica en GitHub Container Registry (`ghcr.io/practimentor/practimentor-api-core`).
