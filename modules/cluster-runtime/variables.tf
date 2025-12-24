variable "tsuru_cluster_name" {
  type        = string
  description = "Cluster name"
}

variable "tsuru_initial_pool" {
  type        = string
  description = "Name of the initial pool to create in the cluster"
}

variable "tsuru_ephemeral_storage" {
  default     = "100Mi"
  type        = string
  description = "Sets limit for ephemeral storage for created pods. This config may be prefixed with `<pool-name>:`. Defaults to 100Mi"
}

variable "register_on_tsuru" {
  type    = bool
  default = true
}

variable "enable_versioned_services" {
  type        = bool
  default     = true
  description = "Allow the creation of multiple services for each pair of {process, version} from the app. The default behavior creates versioned services only in a multi versioned deploy scenario."
}

variable "job_event_creation" {
  type        = bool
  default     = false
  description = "Enable k8s event data tracking cross-referencing with Jobs and send them to tsuru database"
}

variable "extra_custom_data" {
  default = {}
  type    = map(string)
}

variable "cluster_addresses" {
  type        = list(string)
  description = "List of cluster addresses"
}

variable "kube_server" {
  type        = string
  description = "Kubernetes API server address"
}

variable "kube_ca" {
  type        = string
  description = "Kubernetes cluster CA certificate (PEM data or file path)"
}

variable "kube_client_cert" {
  type        = string
  description = "Kubernetes client certificate (PEM data or file path)"
}

variable "kube_client_key" {
  type        = string
  description = "Kubernetes client key (PEM data or file path)"
}
