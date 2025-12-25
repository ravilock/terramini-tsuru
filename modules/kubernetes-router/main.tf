resource "helm_release" "kubernetes-router" {
  name            = "kubernetes-router"
  namespace       = "tsuru-system"
  chart           = "https://github.com/tsuru/charts/releases/download/kubernetes-router-0.1.16/kubernetes-router-0.1.16.tgz"
  force_update    = false
  cleanup_on_fail = true
  values = [
    templatefile("${path.module}/values/kubernetes-router.yaml", {
      replicas  = var.replicas
      tag       = var.kubernetes_router_image_tag
      resources = var.resources
    })
  ]
}

data "kubernetes_secret" "kubernetes-router" {
  metadata {
    name      = "kubernetes-router"
    namespace = "tsuru-system"
  }

  depends_on = [helm_release.kubernetes-router]
}
