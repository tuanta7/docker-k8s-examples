.PHONY: dev

# https://docs.docker.com/engine/install/ubuntu/
install-docker-ubuntu:
	bash scripts/install-docker-ubuntu.sh

start-docker-ubuntu:
	sudo systemctl start docker

stop-docker-ubuntu:
	sudo systemctl stop docker

status-docker-ubuntu:
	sudo systemctl status docker

start-ssh-server:
	sudo apt update
	sudo apt install -y openssh-server
	sudo systemctl enable --now ssh

start-nginx:
	sudo apt update
	sudo apt install -y nginx libnginx-mod-stream 
	sudo systemctl start nginx

reload-nginx:
	sudo install -m 644 config/nginx/dev.nginx.conf /etc/nginx/modules-enabled/99-dev-infra.conf
	sudo nginx -t
	sudo systemctl reload nginx

start-dev-infra: 
	sudo bash scripts/prepare-dev-storage.sh
	docker compose -f config/compose/docker-compose.dev.yaml up -d

dev: start-dev-infra start-nginx reload-nginx