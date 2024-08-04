# Build Using SDK image
FROM mcr.microsoft.com/dotnet/sdk:8.0-jammy AS build
WORKDIR /src
COPY . .
RUN dotnet restore "Project1Api/Project1Api.csproj" 
RUN dotnet build "Project1Api/Project1Api.csproj" -c Release -o /app/build --no-restore 
RUN dotnet publish "Project1Api/Project1Api.csproj" -c Release -o /app/publish --no-restore 

# Final aspnet runtime image
FROM mcr.microsoft.com/dotnet/aspnet:8.0-jammy AS runtime

# Use non root port.
EXPOSE 8080

# Copy application binaries
USER app
WORKDIR /app
COPY --from=build /app/publish .

ENTRYPOINT ["dotnet", "Project1Api.dll"]