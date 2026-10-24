.PHONY: install-k3s-server uninstall-k3s-server

# https://docs.k3s.io/quick-start
# https://docs.k3s.io/installation/packaged-components#disabling-manifests
install-k3s-server:
	bash -o pipefail -c 'curl -fsSL https://get.k3s.io | sh -s - server --disable=traefik'

# https://docs.k3s.io/installation/uninstall
uninstall-k3s-server:
	sudo /usr/local/bin/k3s-uninstall.sh
