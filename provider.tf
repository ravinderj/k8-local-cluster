terraform {
  required_providers {
    k3d = {
      source  = "pvotal-tech/k3d"
      version = "0.0.6"
    }
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.0.1"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "2.9.0"
    }
  }
}

provider "docker" {
  host = "unix:///${pathexpand("~/.colima/default/docker.sock")}"
  registry_auth {
    address       = "http://localhost:5002"
    auth_disabled = true
  }
}

provider "helm" {
  kubernetes {
    config_paths = ["~/.k3d/kubeconfig-dev.yaml"]
  }
}
