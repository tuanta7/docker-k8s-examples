# Kong Ingress Controller Demo

- K3s, managed with K9s
- Kong: Routing, Rate Limit
- Custom plugin + Redis cache
- Prometheus

## K3s Cluster Access

Reference: [Cluster Access](https://docs.k3s.io/cluster-access)

Copy the configuration to local home directory, change ownership to the current user account and restrict permissions

```sh
mkdir -p $HOME/.kube
sudo cp /etc/rancher/k3s/k3s.yaml $HOME/.kube/config
sudo chown $USER:$USER $HOME/.kube/config
chmod 600 $HOME/.kube/config

cat $HOME/.kube/config
```

## Kong Custom Plugin
