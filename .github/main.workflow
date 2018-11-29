workflow "Az Login" {
  on = "pull_request"
  resolves = ["Azure CLI"]
}

action "Azure Login" {
  uses = "Azure/github-actions/azure-login@master"
  env = {
    AZURE_SERVICE_PASSWORD = "(*&A:f_ON:.X@b|0t;{{"
    AZURE_SERVICE_APP_ID = "c4023500-019c-48d8-aec3-366433de93ee"
    AZURE_SERVICE_TENANT = "72f988bf-86f1-41af-91ab-2d7cd011db47"
  }
}

action "Azure CLI" {
  uses = "Azure/github-actions/azure-cli@master"
  needs = ["Azure Login"]
  env = {
    AZURE_SCRIPT = "az aks list \necho hell-world\naz account list"
  }
}
