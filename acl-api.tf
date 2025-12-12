module "acl-api" {
  count  = var.acl-api-enabled ? 1 : 0
  source = "./acl-api/"

  dns_zone               = "cluster.local"
  tsuru_host             = "https://lab.tsuru.globoi.com"
  tsuru_token            = var.tsuru_token
  dbaas_mongodb_endpoint = var.mongodb_endpoint
}
