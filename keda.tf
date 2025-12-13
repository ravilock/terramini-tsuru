module "keda" {
  count  = var.keda-enabled ? 1 : 0
  source = "./modules/keda/"
}
