variable "tsuru_token" {
  type        = string
  sensitive   = true
  description = "Token used to authenticate with the Tsuru API."
  default     = "98a1a82d96b3e62747dbc1e5fe4b623589d0907b69805486efe42d2918ec2fd2"
}

variable "mongodb_endpoint" {
  type        = string
  sensitive   = true
  description = "The MongoDB endpoint for the DBaaS service."
  default     = "mongodb://host.minikube.internal:27017/acl-api"
}

variable "acl-api-enabled" {
  type        = bool
  description = "Flag to enable or disable the deployment of the ACL API service."
  default     = true
}

variable "acl-operator-enabled" {
  type        = bool
  description = "Flag to enable or disable the deployment of the ACL Operator."
  default     = true
}

variable "deploy-agent-enabled" {
  type        = bool
  description = "Flag to enable or disable deploy agent inside the cluster."
  default     = true
}

variable "build-kit-enabled" {
  type        = bool
  description = "Flag to enable or disable build kit inside the cluster."
  default     = true
}

variable "keda-enabled" {
  type        = bool
  description = "Flag to enable or disable KEDA inside the cluster."
  default     = true
}

variable "prometheus-stack-enabled" {
  type        = bool
  description = "Flag to enable or disable Prometheus inside the cluster."
  default     = true
}

variable "cluster-address" {
  type        = string
  description = "Kubernetes Cluster address"
}

variable "cluster-port" {
  type        = string
  description = "Kubernetes Cluster port"
}

variable "kube_server" {
  type        = string
  description = "Kubernetes API server address"
}

variable "kube_ca" {
  type        = string
  description = "Kubernetes cluster CA certificate (file path)"
}

variable "kube_client_cert" {
  type        = string
  description = "Kubernetes client certificate (file path)"
}

variable "kube_client_key" {
  type        = string
  description = "Kubernetes client key (file path)"
}

variable "tsuru_address" {
  type        = string
  description = "Tsuru API server address"
}
