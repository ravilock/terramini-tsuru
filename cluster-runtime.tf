module "cluster-runtime" {
  source = "./modules/cluster-runtime"

  tsuru_cluster_name = "local"
  tsuru_initial_pool = "local"
  cluster_addresses  = ["https://${var.cluster-address}:${var.cluster-port}"]
  extra_custom_data = {
    # "build-service-address" = "dns:////100.64.100.100:${module.deploy-agent[0].service_ip_address}"
    "build-service-address" = "dns:///deploy-agent.tsuru.svc.cluster.local:80"
    "build-service-tls"     = false
    "registry"              = "100.64.100.100:5000/tsuru"
    "registry-insecure"     = true
  }
  kube_server      = var.kube_server
  kube_ca          = var.kube_ca
  kube_client_cert = var.kube_client_cert
  kube_client_key  = var.kube_client_key

  depends_on = [module.tsuru-api]
}
