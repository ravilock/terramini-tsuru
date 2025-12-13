module "build-kit" {
  count            = var.build-kit-enabled ? 1 : 0
  source           = "./modules/build-kit/"
  buildkit_enabled = var.build-kit-enabled
}
