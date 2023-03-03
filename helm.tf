resource "helm_release" "dwarka-helm" {
  name     = "dwarka-helm"
  chart    = "./helm-charts/dwarka"
  version  = "v1"

  depends_on = [
    docker_registry_image.helloworld,
    local_sensitive_file.kubeconfig
  ]
}
