server:
  service:
    type: NodePort
    nodePort: 30090
  persistentVolume:
    enabled: true
    size: 5Gi
  global:
    scrape_interval: 30s
    evaluation_interval: 30s
  additionalScrapeConfigs:
    name: "custom-scrapes"  # This will refer to a secret/configmap
    key: "prometheus-additional.yaml"
extraScrapeConfigs: |
  - job_name: pi-node
    static_configs:
      - targets: ["${rpi_ip}:9100"]
        labels:
          cluster: homelab
          node: raspberrypi
  - job_name: pi-kube-state-metrics
    static_configs:
      - targets: ["${rpi_ip}:8080"]
        labels:
          cluster: homelab

alertmanager:
  enabled: false
prometheus-pushgateway:
  enabled: false