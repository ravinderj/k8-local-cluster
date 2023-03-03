resource "k3d_cluster" "swarm" {
  name    = var.cluster_name
  servers = 1
  agents  = 2

  registries {
    use = [
      "k3d-myregistry.local:5002"
    ]
  }
}

data "k3d_cluster" "swarm" {
  name = k3d_cluster.swarm.name
}

output "kubeconfig" {
    value = data.k3d_cluster.swarm.kubeconfig_raw
}