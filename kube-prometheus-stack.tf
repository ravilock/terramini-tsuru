module "kube-prometheus-stack" {
  count        = var.prometheus-stack-enabled ? 1 : 0
  source       = "./modules/kube-prometheus-stack/"
  cluster_name = "minikube"
}
