output "tsuru_api_http_nodeport" {
  description = "The URL of the Tsuru API"
  value       = data.kubernetes_service.tsuru_api.spec[0].port[1].node_port
}
