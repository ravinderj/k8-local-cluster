locals {
  cluster_name = "swarm"
}

module "cluster-1" {
  source = "./modules/local"
}

resource "local_sensitive_file" "kubeconfig" {
  content  = module.cluster-1.kubeconfig
  filename = pathexpand("~/.k3d/kubeconfig-${local.cluster_name}.yaml")
}

moved {
  from = k3d_cluster.swarm
  to   = module.cluster-1.k3d_cluster.swarm
}
