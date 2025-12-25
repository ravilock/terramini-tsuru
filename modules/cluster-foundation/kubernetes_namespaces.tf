resource "kubernetes_namespace" "tsuru-system" {
  metadata {
    name = "tsuru-system"
    labels = {
      "name"                         = "tsuru-system"
      "prometheus.io/managed-by"     = "kube-prometheus-stack"
      "app.kubernetes.io/part-of"    = "cluster-runtime"
      "app.kubernetes.io/managed-by" = "terraform"
    }
  }

  lifecycle {
    prevent_destroy = true
  }
}

resource "kubernetes_namespace" "tsuru" {
  metadata {
    name = "tsuru"
    labels = {
      "name"                         = "tsuru"
      "app.kubernetes.io/part-of"    = "cluster-runtime"
      "app.kubernetes.io/managed-by" = "terraform"
    }
  }

  lifecycle {
    prevent_destroy = true
  }
}
