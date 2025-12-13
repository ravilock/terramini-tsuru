resource "helm_release" "buildkit" {
  count = var.buildkit_enabled ? 1 : 0

  name      = "buildkit"
  namespace = "tsuru"
  chart     = "https://github.com/tsuru/charts/releases/download/buildkit-0.2.2/buildkit-0.2.2.tgz"
  values = [
    templatefile("${path.module}/values/build-kit.yaml", merge({
      replicas          = 0 # deploy agent scales to 1
      image_pull_policy = "IfNotPresent"
    }, var.buildkit_values)),
  ]
}
