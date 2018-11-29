workflow "Build and Deploy to Azure" {
  on = "push"
  resolves = ["Deploy to Web App"]
}

action ".NET Publish" {
  uses = "Azure/github-actions/dotnetcore-cli@0295e7b"
  args = "publish webapp/aspnet-core-dotnet-core/aspnet-core-dotnet-core.csproj  -c Release -o /output; ls /"
}

action "Azure Login" {
  uses = "Azure/github-actions/azure-login@master"
  needs = [".NET Publish"]
  env = {
    AZURE_SERVICE_APP_ID = "586a5f0f-3720-42b2-82ef-d4479d53a0a5"
    AZURE_SERVICE_PASSWORD = "/gk+ZqLp7E2PDrzuTvRg0Zju67ExLgAZ0wJisZaV6OM="
    AZURE_SERVICE_TENANT = "72f988bf-86f1-41af-91ab-2d7cd011db47"
  }
}

action "Deploy to Web App" {
  uses = "Azure/github-actions/web-app-deploy@master"
  needs = ["Azure Login"]
  env = {
    AZURE_APP_NAME = "vincaapp"
    AZURE_APP_PACKAGE_LOCATION = "/output"
  }
}