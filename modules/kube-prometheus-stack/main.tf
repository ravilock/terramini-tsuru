locals {
  prometheus_image_tag   = "v2.48.1"
  kube_state_metrics_tag = "v2.10.1"
}

resource "helm_release" "kube-prometheus-stack" {
  name            = "kube-prometheus-stack"
  namespace       = "tsuru-system"
  repository      = "https://prometheus-community.github.io/helm-charts"
  chart           = "kube-prometheus-stack"
  version         = "36.0.1"
  force_update    = false
  cleanup_on_fail = true
  values = [
    templatefile("${path.module}/values/prometheus.yaml", {
      "prometheus_image_tag"   = local.prometheus_image_tag
      "kube_state_metrics_tag" = local.kube_state_metrics_tag

      "cluster_name" = var.cluster_name
      "disk_size"    = var.disk_size
      "replicas"     = var.replicas

      "alertmanager_replicas" = var.alertmanager_replicas

      "cpu_limits"      = var.resources.cpu_limits,
      "cpu_requests"    = var.resources.cpu_requests,
      "memory_limits"   = var.resources.memory_limits,
      "memory_requests" = var.resources.memory_requests,

      "kube_state_metrics_resources"  = var.kube_state_metrics_resources
      "prometheus_operator_resources" = var.prometheus_operator_resources
      "remote_write"                  = null
      "remote_read"                   = null
      "node_selector"                 = null
      "affinity"                      = null
      "tolerations"                   = null
    })
  ]
}
