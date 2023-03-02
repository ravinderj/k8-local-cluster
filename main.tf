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
