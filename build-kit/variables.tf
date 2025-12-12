variable "buildkit_enabled" {
  type        = bool
  description = "Flag to enable or disable buildkit"
  default     = true
}

variable "buildkit_values" {
  default = {}
}
