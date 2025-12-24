locals {
  default_custom_data = {
    "disable-default-node-selector" = "true"
    "ephemeral-storage"             = var.tsuru_ephemeral_storage
    "enable-versioned-services"     = var.enable_versioned_services
    "job-event-creation"            = var.job_event_creation
  }
}

resource "tsuru_cluster" "tsuru-cluster" {
  name        = var.tsuru_cluster_name
  custom_data = merge(local.default_custom_data, var.extra_custom_data)
  initial_pools = [
    var.tsuru_initial_pool,
  ]
  addresses = var.cluster_addresses

  kube_config {
    cluster {
      server                     = var.kube_server
      insecure_skip_tls_verify   = false
      certificate_authority_data = base64encode(file(var.kube_ca))
    }
    user {
      client_certificate_data = base64encode(file(var.kube_client_cert))
      client_key_data         = base64encode(file(var.kube_client_key))
    }
  }

  count = var.register_on_tsuru ? 1 : 0
}
