FROM mcr.microsoft.com/dotnet/sdk:10.0 AS build
LABEL org.opencontainers.image.authors="jecklgamis@gmail.com"

WORKDIR /src
COPY dotnet-webapi-example.csproj .
RUN dotnet restore
COPY . .
RUN dotnet publish -c release -o /app

FROM mcr.microsoft.com/dotnet/aspnet:10.0
WORKDIR /app
COPY --from=build /app .
ENTRYPOINT ["dotnet", "dotnet-webapi-example.dll"]
