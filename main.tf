resource "k3d_cluster" "swarm" {
  name    = "swarm"
  servers = 1
  agents  = 2

  kubeconfig {
    update_default_kubeconfig = true
    switch_current_context    = true
  }
}
