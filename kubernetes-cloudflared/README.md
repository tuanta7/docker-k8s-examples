# Cloudflare Tunnel

Cloudflare tunnel initiates outbound connections to Cloudflare Edge and reuse that connection for sending/receiving data. Since no inbound connections to the cloudflared pods are required for normal tunnel operation, a Kubernetes Service is not required.
