module "acl-operator" {
  count  = var.acl-operator-enabled ? 1 : 0
  source = "./acl-operator/"

  tsuru_address = "http://host.minikube.internal:8080"
  tsuru_token   = var.tsuru_token

  aclapi_address  = "http://192.168.49.2:32253"
  aclapi_user     = "admin@admin.com"
  aclapi_password = "admin@123"
  image_tag       = "0.1.12"
  metrics         = false
}
