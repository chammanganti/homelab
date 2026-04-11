resource "helm_release" "strimzi_operator" {
  name             = var.name
  repository       = "oci://quay.io/strimzi-helm"
  chart            = "strimzi-kafka-operator"
  namespace        = var.namespace
  create_namespace = true
  version          = var.chart_version

  wait    = true
  timeout = 300

  set = [
    {
      name  = "watchNamespaces[0]"
      value = "kafka"
    },
    {
      name  = "resources.requests.memory"
      value = "256Mi"
    },
    {
      name  = "resources.limits.memory"
      value = "512Mi"
    }
  ]
}
