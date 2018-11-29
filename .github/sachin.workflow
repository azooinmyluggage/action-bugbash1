workflow "Sachin- New workflow" {
  on = "push"
  resolves = ["Login"]
}

action "Login" {
  uses = "Azure/github-actions/azure-login@master"
}
