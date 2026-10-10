.PHONY: install-docker-ubuntu start-docker-ubuntu stop-docker-ubuntu status-docker-ubuntu start-ssh-server start-nginx

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
