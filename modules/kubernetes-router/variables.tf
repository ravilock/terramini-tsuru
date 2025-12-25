variable "replicas" {
  type    = number
  default = 1
}

variable "kubernetes_router_image_tag" {
  type    = string
  default = "0.25.2"
}

variable "resources" {
  type = object({
    limits   = map(string)
    requests = map(string)
  })

  default = {
    limits = {
      cpu    = "500m"
      memory = "256Mi"
    }
    requests = {
      cpu    = "100m"
      memory = "256Mi"
    }
  }
}
