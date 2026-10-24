# Kong Ingress Controller Demo

- K3s, managed with K9s
- Kong: Routing, Rate Limit
- Custom plugin + Redis cache
- Prometheus

## K3s server

Run on the Linux server with Bash, curl, and sudo available:

```sh
cd kubernetes-kong-redis
make install-k3s-server
sudo k3s kubectl get nodes
```

Uses the [official K3s installer](https://docs.k3s.io/quick-start) with the bundled
Traefik ingress controller enabled by default on a fresh installation.

When ready to switch ingress to Kong, disable Traefik on the systemd-based server:

```sh
make disable-traefik
```

This writes a persistent configuration drop-in and restarts K3s. K3s then
[uninstalls the Traefik add-on](https://docs.k3s.io/installation/packaged-components),
interrupting routes served by Traefik. Run on every server in a multi-server cluster.
The target assumes the default K3s config path and no CLI `--disable` override.

To remove the server:

```sh
make uninstall-k3s-server
```

[Uninstalling](https://docs.k3s.io/installation/uninstall) also deletes the local
cluster datastore and local persistent volume data.
