resource "helm_release" "keda" {
  name      = "keda"
  namespace = "tsuru-system"

  repository = "https://kedacore.github.io/charts"
  chart      = "keda"
  version    = "2.18.2"

  values = [
    templatefile("${path.module}/values/keda.yaml", {}),
  ]
}
