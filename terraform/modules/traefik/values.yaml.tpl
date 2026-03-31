ports:
  web:
    port: 80
    nodePort: 30000
    http:
      redirections:
        entryPoint:
          to: websecure
          scheme: https
          permanent: true
  websecure:
    port: 443
    nodePort: 30001

api:
  dashboard: true
  insecure: true

ingressRoute:
  dashboard:
    enabled: false

ingressClass:
  enabled: false

providers:
  kubernetesIngress:
    enabled: false
  kubernetesGateway:
    enabled: false
  kubernetesCRD:
    enabled: true
    allowCrossNamespace: true

logs:
  general:
    level: INFO
  access:
    enabled: true

metrics:
  prometheus:
    enabled: true

tolerations:
%{ for t in tolerations ~}
  - key: ${t.key}
    operator: ${t.operator}
%{ if t.value != "" ~}
    value: ${t.value}
%{ endif ~}
    effect: ${t.effect}
%{ endfor ~}

service:
  type: LoadBalancer

deployment:
  replicas: 1