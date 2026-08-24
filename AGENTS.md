# AGENTS.md — utp-agent-api-academic

API académica del proyecto **utp-agent**. C# .NET 10 con ASP.NET Core.
Responsable: **Sergio**.

## Si alguien se presenta por primera vez

Cuando el usuario diga algo como "hola, soy Sergio":

1. Lee `docs/onboarding.md` del repo `utp-agent-platform` y ubica su sección.
2. Verifica qué le falta instalar ejecutando: `dotnet --list-sdks`,
   `git --version`. Debe aparecer un SDK 10.x — si la lista sale vacía, tiene
   runtimes pero no SDK y no podrá compilar.
3. Guíalo instalando **una herramienta a la vez**, esperando que confirme antes
   de seguir. No le des todos los comandos de golpe.
4. Cuando el entorno esté listo, pídele el número de issue asignado y trabaja
   solo dentro de lo que ese issue autoriza.
5. Si algo no está en el issue, detente y dile que comente en el issue.

## Git lo ejecuta la persona, no tú

No ejecutes `git add`, `commit`, `push`, `pull`, `merge`, `rebase`, `reset` ni
`checkout` por tu cuenta. Puedes leer con `status`, `log`, `diff` y `show`.

Cuando haga falta una operación de escritura, **no digas "haz commit"**. Escribe
el comando exacto y completo, listo para copiar, con el mensaje de commit ya
redactado, y explica en una línea qué hace:

```bash
git add src/Controllers/CursosController.cs
git commit -m "feat(api): agregar endpoint de listado de cursos"
git push
```

Solo ejecútalos tú si la persona te lo pide explícitamente.

## Comandos

El proyecto todavía no está creado — se hace en el Sprint 1.

```bash
dotnet restore                  # restaurar paquetes
dotnet build                    # compilar
dotnet run                      # levantar la API
dotnet test                     # pruebas
dotnet ef migrations add <Nombre>   # crear migracion
dotnet ef database update           # aplicar migraciones
```

Los secretos en desarrollo van con `dotnet user-secrets`, **nunca** en
`appsettings.json`.

## Qué hace este servicio

Es la **autoridad del sistema**. Decide todo lo relacionado con identidad y
permisos: usuarios, roles, cursos, matrículas y metadatos de documentos.
Cualquier otro servicio confía en lo que este autoriza.

## Qué NO le corresponde

- **No genera embeddings ni respuestas de IA.** Eso es de `utp-agent-api-rag`.
- **No guarda archivos.** Los PDFs van a MinIO o Azure Blob; aquí solo su metadato.
- **No renderiza interfaz.**

## Dependencias clave

- **ASP.NET Core** con OAuth2 Resource Server, validando tokens de Keycloak
- **Entity Framework Core** con Npgsql sobre PostgreSQL
- **Swagger / OpenAPI** para documentar los contratos

## Modelo de datos

Toda entidad de negocio lleva una columna `TenantId` desde el inicio, aunque el
aislamiento estricto recién se activa en el Sprint 3 mediante *Global Query
Filters* de EF Core. **No quitar esa columna** aunque parezca sin uso.

## Convenciones

**Estrategia de ramificación: GitHub Flow con ramas personales.** `main` es la
única rama permanente compartida y siempre debe quedar ejecutable. No existe rama
`develop`. Cada integrante trabaja en su rama propia `dev/<nombre>`, que **no se
borra** al fusionar. Antes de cada tarea nueva se trae `main` a la rama propia.
Un Pull Request **por tarea**, con `Closes #NN`. Detalle completo en el ADR
2026-08-23-02 del repo `utp-agent-platform`.

- Tu rama: `dev/sergio`. Nunca trabajes sobre `main`
- Rutas versionadas: `/api/v1/...`
- Identificadores `Guid`, nunca enteros autoincrementales
- Errores con formato consistente: código, mensaje y `traceId`
- Commits convencionales con ámbito `api`: `feat(api): ...`

## Prohibido sin confirmación explícita

- No modificar migraciones ya existentes de Entity Framework.
- No agregar ni actualizar paquetes NuGet.
- No modificar `Program.cs` ni la configuración de autenticación.
- No modificar workflows de `.github/`.
- No renombrar entidades, controladores ni endpoints existentes.
- No escribir cadenas de conexión ni claves en `appsettings.json`.
- Si crees que necesitas hacer algo de esta lista, detente y comenta en el issue.
