module "tsuru-api" {
  source = "./modules/tsuru-api/"

  router_api_username = module.kubernetes-router.api_username
  router_api_password = module.kubernetes-router.api_password
}
