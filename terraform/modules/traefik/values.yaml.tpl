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
    enabled: true
  kubernetesCRD:
    enabled: true
    allowCrossNamespace: true

gateway:
  listeners:
    web:
      port: 80
      protocol: HTTP
      namespacePolicy:
        from: All
    websecure:
      port: 443
      protocol: HTTPS
      namespacePolicy:
        from: All
      mode: Terminate
      certificateRefs:
        - kind: Secret
          name: ${tls_secret_name}
          group: ""

tlsStore:
  default:
    defaultCertificate:
      secretName: ${tls_secret_name}

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
