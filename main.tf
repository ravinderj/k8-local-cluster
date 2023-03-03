locals {
  environments = ["dev", "qa"]
}

module "cluster" {
  source = "./modules/local"

  count        = length(local.environments)
  cluster_name = local.environments[count.index]
}

resource "local_sensitive_file" "kubeconfig" {
  count = length(local.environments)

  content  = module.cluster[count.index].kubeconfig
  filename = pathexpand("~/.k3d/kubeconfig-${local.environments[count.index]}.yaml")
}

# Create local container registry
resource "k3d_registry" "myregistry" {
  name = "myregistry.localhost"
  port {
    host      = "localhost"
    host_ip   = "0.0.0.0"
    host_port = "5002"
  }
}

resource "docker_registry_image" "helloworld" {
  name                 = "localhost:5002/dwarka:1.0.0"
  insecure_skip_verify = true
}
