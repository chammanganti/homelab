global:
  domain: ${domain}

configs:
  params:
    server.insecure: true

server:
  ingress:
    enabled: true
    ingressClassName: traefik
    annotations:
      traefik.ingress.kubernetes.io/router.entrypoints: websecure
    tls: true
    tlsSecretName: ${tls_secret_name}
