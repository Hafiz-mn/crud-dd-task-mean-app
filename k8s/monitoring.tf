resource "helm_release" "prometheus" {
  name             = "prometheus"
  namespace        = "monitoring"
  create_namespace = true

  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "prometheus"
  version    = "15.12.1"   # use a stable version

  depends_on = [module.eks]
}

resource "helm_release" "grafana" {
  name             = "grafana"
  namespace        = "monitoring"
  create_namespace = true

  repository = "https://grafana.github.io/helm-charts"
  chart      = "grafana"
  version    = "15.2.1"   # use a stable version

  depends_on = [module.eks]
  
   set = [
    {
      name  = "adminPassword"
      value = "admin"
    }
  ]
}



