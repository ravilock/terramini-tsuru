variable "dns_zone" {}

variable "replicas" {
  type    = number
  default = 1
}

variable "image_tag" {
  default = "0.1.8"
}

variable "image_pull_policy" {
  type    = string
  default = "Always"
}

variable "api_username" {
  default   = "admin@admin.com"
  sensitive = true
}

variable "api_password" {
  default   = "admin@123"
  sensitive = true
}

variable "resource_cpu" {
  default = "200m"
}

variable "resource_memory" {
  default = "256Mi"
}

variable "tsuru_host" {
  type = string
}

variable "tsuru_token" {
  sensitive = true
}

variable "dbaas_mongodb_endpoint" {
  sensitive = true
}

variable "enable_pdb" {
  default = false
}
