resource "helm_release" "deploy-agent" {
  name            = "deploy-agent"
  namespace       = "tsuru"
  chart           = "https://github.com/tsuru/charts/releases/download/deploy-agent-1.6.1/deploy-agent-1.6.1.tgz"
  force_update    = false
  cleanup_on_fail = true
  values = [
    templatefile("${path.module}/values/deploy-agent.yaml", {
    })
  ]
}
