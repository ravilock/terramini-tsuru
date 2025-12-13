variable "tsuru_address" {
  type = string
}

variable "tsuru_token" {
  description = "ACL API user"
  type        = string
  sensitive   = true
}

variable "aclapi_address" {
  type = string
  ## chart           = "${path.module}/acl-operator-0.1.13.tgz"
}

variable "aclapi_user" {
  description = "ACL API user"
  type        = string
  sensitive   = true
}

variable "aclapi_password" {
  description = "ACL API user password"
  type        = string
  sensitive   = true
}

variable "gc_dry_run" {
  type    = bool
  default = true
}

variable "replicas" {
  type    = number
  default = 1
}

variable "image_tag" {
  description = "ACL Operator image tag"
  type        = string
  default     = "0.1.11"
}

variable "metrics" {
  description = "enable Prometheus metrics endpoint scraping"
  type        = bool
  default     = false
}

variable "gcp" {
  type = object({
    enabled = bool
    project = string
    region  = string
  })

  default = {
    enabled = false
    project = ""
    region  = ""
  }
}

variable "dns_config" {
  default = {
    "options" = [{ "name" = "ndots", "value" = "1" }]
  }
}

variable "affinity" {
  default = {}
}

variable "tolerations" {
  default = []
}

variable "resources" {
  default = {
    "limits" = {
      "cpu"    = "500m"
      "memory" = "512Mi"
    }
    "requests" = {
      "cpu"    = "500m"
      "memory" = "512Mi"
    }
  }
}
