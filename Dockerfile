FROM mcr.microsoft.com/dotnet/sdk:10.0 AS build
WORKDIR /src
COPY Academic.Api.csproj ./
RUN dotnet restore Academic.Api.csproj
COPY Program.cs appsettings.json ./
COPY Properties ./Properties
RUN dotnet publish Academic.Api.csproj -c Release -o /app --no-restore

FROM mcr.microsoft.com/dotnet/aspnet:10.0 AS runtime
WORKDIR /app
COPY --from=build /app ./
ENV ASPNETCORE_URLS=http://+:8080
EXPOSE 8080
USER $APP_UID
ENTRYPOINT ["dotnet", "Academic.Api.dll"]
