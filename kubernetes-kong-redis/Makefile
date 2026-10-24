.PHONY: install-k3s-server k3s-status uninstall-k3s-server install-helm install-plugins install-kong-ingress-controller deploy-plugins

SHELL := /bin/bash
.SHELLFLAGS := -eu -o pipefail -c

KUBECTL := sudo k3s kubectl

# https://docs.k3s.io/quick-start
# https://docs.k3s.io/installation/packaged-components#disabling-manifests
install-k3s-server:
	bash -o pipefail -c 'curl -fsSL https://get.k3s.io | sh -s - server --disable=traefik'

k3s-status:
	$(KUBECTL) get nodes
	sudo systemctl status k3s

# https://docs.k3s.io/installation/uninstall
uninstall-k3s-server:
	sudo /usr/local/bin/k3s-uninstall.sh

# https://helm.sh/docs/intro/install/
install-helm:
	curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-4
	chmod 700 get_helm.sh
	./get_helm.sh

# https://developer.konghq.com/kubernetes-ingress-controller/custom-plugins/
install-plugins:
	$(KUBECTL) create namespace kong --dry-run=client -o yaml | $(KUBECTL) apply -f -
	$(KUBECTL) create configmap kong-plugin-hello-world --namespace kong --from-file=plugins/hello-world --dry-run=client -o yaml | $(KUBECTL) apply -f -
# 	$(KUBECTL) create configmap kong-plugin-introspector --namespace kong --from-file=plugins/introspector --dry-run=client -o yaml | $(KUBECTL) apply -f -

# https://developer.konghq.com/kubernetes-ingress-controller/install/
install-kong-ingress-controller: install-plugins
	sudo helm repo add kong https://charts.konghq.com
	sudo helm repo update
	sudo helm upgrade --install kong kong/ingress \
		--kubeconfig /etc/rancher/k3s/k3s.yaml \
		--namespace kong \
		--create-namespace \
		--values ./charts/values.yaml \
		--wait --timeout 5m

deploy-plugins: install-kong-ingress-controller
	$(KUBECTL) rollout restart deployment/kong-gateway --namespace kong
	$(KUBECTL) rollout status deployment/kong-gateway --namespace kong --timeout=300s
	$(KUBECTL) apply -f manifests/hello-world.yaml
# 	$(KUBECTL) apply -f manifests/introspector.yaml
