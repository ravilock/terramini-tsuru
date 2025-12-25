resource "helm_release" "tsuru-api" {
  name            = "tsuru-api"
  namespace       = "tsuru-system"
  chart           = "https://github.com/tsuru/charts/releases/download/tsuru-api-0.3.10/tsuru-api-0.3.10.tgz"
  force_update    = false
  cleanup_on_fail = true
  values = [
    templatefile("${path.module}/values/tsuru-api.yaml", {
      mongodb_url               = local.effective_mongodb_url
      docker_registry           = var.docker_registry
      docker_registry_namespace = var.docker_registry_namespace
      image_tag                 = var.image_tag
      router_api_url            = var.router_api_url
      router_api_username       = var.router_api_username
      router_api_password       = var.router_api_password
    })
  ]
}

data "kubernetes_service" "tsuru_api" {
  metadata {
    name      = "tsuru-api"
    namespace = "tsuru-system"
  }
}
