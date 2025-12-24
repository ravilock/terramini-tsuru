output "service_ip_address" {
  description = "The IP address of the deploy agent service"
  value       = data.kubernetes_service.deploy_agent_svc.spec.0.port.0.node_port
}
