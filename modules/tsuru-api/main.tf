resource "helm_release" "tsuru-api" {
  name            = "tsuru-api"
  namespace       = "tsuru"
  chart           = "https://github.com/tsuru/charts/releases/download/tsuru-api-0.3.10/tsuru-api-0.3.10.tgz"
  force_update    = false
  cleanup_on_fail = true
  values = [
    templatefile("${path.module}/values/tsuru-api.yaml", {
      mongodb_url = local.effective_mongodb_url
    })
  ]
}
