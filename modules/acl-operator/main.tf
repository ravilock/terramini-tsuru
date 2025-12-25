resource "helm_release" "acl-operator" {
  name            = "acl-operator"
  namespace       = "tsuru-system"
  chart           = "https://github.com/tsuru/charts/releases/download/acl-operator-0.1.13/acl-operator-0.1.13.tgz"
  force_update    = true
  cleanup_on_fail = true
  values = [
    templatefile("${path.module}/values/acl-operator.yaml", {
      tsuru_address = var.tsuru_address
      tsuru_token   = var.tsuru_token

      replicas = var.replicas

      aclapi_address  = var.aclapi_address
      aclapi_user     = var.aclapi_user
      aclapi_password = var.aclapi_password

      gc_dry_run = var.gc_dry_run

      image_tag = var.image_tag

      dns_config = jsonencode(var.dns_config)

      affinity    = jsonencode(var.affinity)
      tolerations = jsonencode(var.tolerations)

      metrics = var.metrics

      resources = jsonencode(var.resources)

    })
  ]
}
