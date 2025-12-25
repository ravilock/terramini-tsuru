terraform {
  required_providers {
    tsuru = {
      source  = "tsuru/tsuru"
      version = "2.17.1"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.38.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "3.0.2"
    }
  }
}

provider "kubernetes" {
  config_path    = "~/.kube/config"
  config_context = "minikube"
}

provider "helm" {
  kubernetes = {
    config_path = "~/.kube/config"
  }
}

provider "tsuru" {
  host = "http://192.168.49.2:${module.tsuru-api.tsuru_api_http_nodeport}"
}
