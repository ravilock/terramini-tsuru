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
  host = var.tsuru_address
}
