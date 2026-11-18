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
