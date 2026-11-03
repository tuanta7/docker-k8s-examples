# MetalLB

Reference: [MetalLB Installation](https://metallb.universe.tf/installation/)

> [!NOTE] TL;DR
> MetalLB makes a Kubernetes LoadBalancer Service reachable from outside the cluster

In a typical Kubernetes web deployment, MetalLB does not perform HTTP/HTTPS load balancing or application-layer routing.

Instead, it allocates external IP addresses to LoadBalancer Services and advertises their reachability to the surrounding network using ARP/NDP (Layer 2 mode) or BGP.
