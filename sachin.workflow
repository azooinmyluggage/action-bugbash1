workflow "New workflow" {
  on = "push"
  resolves = ["Login"]
}

action "Login" {
  uses = "azure/github-actions/azure-login@master"
}
