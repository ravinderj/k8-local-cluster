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
  }
}

provider "docker" {
  host = "unix:///${pathexpand("~/.colima/default/docker.sock")}"
  registry_auth {
    address       = "http://localhost:5002"
    auth_disabled = true
  }
}
