variable "create_mongodb" {
  description = "Whether to create the MongoDB StatefulSet and Service"
  type        = bool
  default     = true
}

variable "mongodb_url" {
  description = "MongoDB URL. Required if create_mongodb is false"
  type        = string
  default     = ""

  validation {
    condition     = var.create_mongodb || var.mongodb_url != ""
    error_message = "mongodb_url must be provided when create_mongodb is false"
  }
}

variable "docker_registry" {
  description = "Docker registry URL"
  type        = string
  default     = "100.64.100.100:5000"
}

variable "docker_registry_namespace" {
  description = "Docker registry namespace"
  type        = string
  default     = "tsuru"
}

variable "image_tag" {
  description = "Tsuru API image tag"
  type        = string
  default     = "dev"
}

variable "router_api_url" {
  description = "Kubernetes router API URL"
  type        = string
  default     = "http://kubernetes-router.tsuru.svc.cluster.local/api"
}

locals {
  effective_mongodb_url = var.create_mongodb ? "tsuru-mongodb.tsuru.svc.cluster.local:27017" : var.mongodb_url
}
