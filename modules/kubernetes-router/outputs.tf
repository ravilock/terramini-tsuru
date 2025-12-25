output "api_username" {
  description = "Kubernetes router API username"
  value       = data.kubernetes_secret.kubernetes-router.data["username"]
  sensitive   = true
}

output "api_password" {
  description = "Kubernetes router API password"
  value       = data.kubernetes_secret.kubernetes-router.data["password"]
  sensitive   = true
}
