adminPassword: admin

service:
  type: NodePort
  nodePort: 30030

persistence:
  enabled: true
  size: 1Gi

datasources:
  datasources.yaml:
    apiVersion: 1
    datasources:
      - name: Prometheus
        type: prometheus
        url: ${prometheus_url}
        isDefault: true
        access: proxy
      - name: Loki
        type: loki
        url: ${loki_url}
        access: proxy

dashboardProviders:
  dashboardproviders.yaml:
    apiVersion: 1
    providers:
      - name: default
        folder: Homelab
        type: file
        options:
          path: /var/lib/grafana/dashboards/default

dashboards:
  default:
    node-exporter:
      gnetId: 1860
      revision: 37
      datasource: Prometheus
    kubernetes-cluster:
      gnetId: 15661
      revision: 1
      datasource: Prometheus
    loki-logs:
      gnetId: 13639
      revision: 2
      datasource: Loki
