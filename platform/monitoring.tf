resource "helm_release" "prometheus" {
  name             = "prometheus"
  namespace        = "monitoring"
  create_namespace = true

  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "prometheus"
  timeout = 600
  version    = "15.12.1"   # use a stable version

   set = [
    {
      name  = "server.persistentVolume.enabled"
      value = "false"
    },
    {
      name  = "alertmanager.persistentVolume.enabled"
      value = "false"
    }
  ]
}

resource "helm_release" "grafana" {
  name             = "grafana"
  namespace        = "monitoring"
  create_namespace = true

  repository = "https://grafana.github.io/helm-charts"
  chart      = "grafana"
  
   set = [
    {
      name  = "adminPassword"
      value = "admin"
    }
  ]
}
resource "helm_release" "loki" {
  name             = "loki"
  namespace        = "monitoring"
  create_namespace = true

  repository = "https://grafana.github.io/helm-charts"
  chart      = "loki-stack"
  version    = "2.10.2"

  set = [
    {
      name  = "grafana.enabled"
      value = "false"
    }
  ]
}









