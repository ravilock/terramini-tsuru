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

locals {
  effective_mongodb_url = var.create_mongodb ? "tsuru-mongodb.tsuru.svc.cluster.local:27017" : var.mongodb_url
}
