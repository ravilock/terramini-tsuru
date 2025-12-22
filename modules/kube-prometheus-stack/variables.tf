variable "cluster_name" {}

variable "ingress_host" {
  default = null
}

variable "alertmanager_ingress_host" {
  default = null
}

variable "disk_size" {
  default = "2Gi"
}

variable "replicas" {
  default = 1
}

variable "affinity" {
  default = null
}

variable "alertmanager_replicas" {
  default = 1
}

variable "resources" {
  type = object({
    cpu_limits      = string
    cpu_requests    = string
    memory_limits   = string
    memory_requests = string
  })

  default = {
    cpu_limits      = "500m"
    cpu_requests    = "500m"
    memory_limits   = "512Mi"
    memory_requests = "512Mi"
  }
}

variable "kube_state_metrics_resources" {
  type = object({
    cpu_limits      = string
    cpu_requests    = string
    memory_limits   = string
    memory_requests = string
  })

  default = {
    cpu_limits      = "300m"
    cpu_requests    = "300m"
    memory_limits   = "512Mi"
    memory_requests = "512Mi"
  }
}

variable "prometheus_operator_resources" {
  type = object({
    cpu_limits      = string
    cpu_requests    = string
    memory_limits   = string
    memory_requests = string
  })

  default = {
    cpu_limits      = "300m"
    cpu_requests    = "300m"
    memory_limits   = "1Gi"
    memory_requests = "1Gi"
  }
}
