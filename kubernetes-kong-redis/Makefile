.PHONY: install-k3s-server k3s-status uninstall-k3s-server install-helm install-plugins install-kong-ingress-controller deploy-plugins

SHELL := /bin/bash
.SHELLFLAGS := -eu -o pipefail -c

# https://docs.k3s.io/quick-start
# https://docs.k3s.io/installation/packaged-components#disabling-manifests
install-k3s-server:
	bash -o pipefail -c 'curl -fsSL https://get.k3s.io | sh -s - server --disable=traefik'

k3s-status:
	sudo k3s kubectl get nodes
	sudo systemctl status k3s

# https://docs.k3s.io/installation/uninstall
uninstall-k3s-server:
	sudo /usr/local/bin/k3s-uninstall.sh

# https://helm.sh/docs/intro/install/
install-helm:
	curl -fsSL -o get_helm.sh \
		https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-4
	chmod 700 get_helm.sh
	./get_helm.sh

# https://developer.konghq.com/kubernetes-ingress-controller/custom-plugins/
install-plugins:
	kubectl create namespace kong --dry-run=client -o yaml | kubectl apply -f -
	kubectl create configmap kong-plugin-hello-world --namespace kong --from-file=plugins/hello-world --dry-run=client -o yaml | kubectl apply -f -
# 	kubectl create configmap kong-plugin-introspector --namespace kong --from-file=plugins/introspector --dry-run=client -o yaml | kubectl apply -f -

# https://developer.konghq.com/kubernetes-ingress-controller/install/
install-kong-ingress-controller: install-plugins
	helm repo add kong https://charts.konghq.com
	helm repo update
	helm upgrade --install kong kong/ingress --namespace kong --create-namespace --values ./charts/values.yaml --wait --timeout 5m

deploy-plugins: install-kong-ingress-controller
	kubectl rollout restart deployment/kong-gateway --namespace kong
	kubectl rollout status deployment/kong-gateway --namespace kong --timeout=300s
	kubectl apply -f manifests/hello-world.yaml
# 	kubectl apply -f manifests/introspector.yaml
