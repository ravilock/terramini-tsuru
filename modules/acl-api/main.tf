resource "helm_release" "acl-api" {
  name            = "acl-api"
  namespace       = "tsuru"
  chart           = "https://github.com/tsuru/charts/releases/download/acl-api-0.0.5/acl-api-0.0.5.tgz"
  force_update    = false
  cleanup_on_fail = true
  values = [
    templatefile("${path.module}/values/template.yaml", {
      dns_zone          = var.dns_zone
      image_tag         = var.image_tag
      image_pull_policy = var.image_pull_policy
      replicas          = var.replicas
      resource_cpu      = var.resource_cpu
      resource_memory   = var.resource_memory
      tsuru_host        = var.tsuru_host
      enable_pdb        = var.enable_pdb
    })
  ]
}

resource "kubernetes_secret" "acl-api" {
  metadata {
    name        = "acl-api"
    namespace   = "tsuru"
    annotations = {}
    labels = {
      "app.kubernetes.io/part-of"    = "acl-api"
      "app.kubernetes.io/managed-by" = "terraform"
    }
  }

  data = {
    "api_username"           = var.api_username
    "api_password"           = var.api_password
    "dbaas_mongodb_endpoint" = var.dbaas_mongodb_endpoint
    "tsuru_token"            = var.tsuru_token
  }
}
