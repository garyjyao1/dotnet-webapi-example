## dotnet-webapi-example

[![Build](https://github.com/jecklgamis/dotnet-webapi-example/actions/workflows/build.yaml/badge.svg)](https://github.com/jecklgamis/dotnet-webapi-example/actions/workflows/build.yaml)

An example Web API app using ASP.NET Core.

Docker : `docker run -it jecklgamis/dotnet-webapi-example:main`

## What's In the Box?
* Web API app using .NET 10
* Docker image
* Kubernetes Helm Chart
* GitHub Action workflows

## Requirements

* [.NET 10](https://dotnet.microsoft.com/en-us/download/dotnet/10.0)
* [Docker](https://www.docker.com/)
* [Make](https://www.gnu.org/software/make/) (optional)

## Building

.NET binary:

```
dotnet build
``` 

Docker image:

```
docker build -t dotnet-web-api-example:main .
```

## Running

.NET binary:
```
dotnet run --environment Development
``` 

`Docker`:
```
docker run \
    -e "DOTNET_ENVIRONMENT=Production" \
    -e "ASPNETCORE_URLS=http://*:8080" \
    -it dotnet-web-api-example:main
```

Then point your browser to http://localhost:8080.


