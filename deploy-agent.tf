module "deploy-agent" {
  count  = var.deploy-agent-enabled ? 1 : 0
  source = "./deploy-agent/"
}
