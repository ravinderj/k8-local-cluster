locals {
  cluster_name = "swarm"
}

resource "k3d_cluster" "swarm" {
  name    = local.cluster_name
  servers = 1
  agents  = 2
}

data "k3d_cluster" "swarm" {
  name = k3d_cluster.swarm.name
}

resource "local_sensitive_file" "kubeconfig" {
  content = data.k3d_cluster.swarm.kubeconfig_raw
  filename = pathexpand("~/.k3d/kubeconfig-${local.cluster_name}.yaml")
}