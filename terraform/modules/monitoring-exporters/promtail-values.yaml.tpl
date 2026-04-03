config:
  clients:
    - url: ${loki_url}/loki/api/v1/push
      backoff_config:
        min_period: 500ms
        max_period: 5m
        max_retries: 10

  snippets:
    pipelineStages:
      - cri: {}

    scrapeConfigs: |
      - job_name: kubernetes-pods
        kubernetes_sd_configs:
          - role: pod

        pipeline_stages:
          - cri: {}

        relabel_configs:
          - source_labels: [__meta_kubernetes_pod_node_name]
            target_label: node

          - source_labels: [__meta_kubernetes_namespace]
            target_label: namespace

          - source_labels: [__meta_kubernetes_pod_name]
            target_label: pod

          - source_labels: [__meta_kubernetes_pod_container_name]
            target_label: container

          - action: replace
            replacement: /var/log/pods/*$1/*.log
            separator: /
            source_labels:
              - __meta_kubernetes_pod_uid
              - __meta_kubernetes_pod_container_name
            target_label: __path__