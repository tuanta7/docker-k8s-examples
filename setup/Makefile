.PHONY: start-ssh-server

# https://docs.docker.com/engine/install/ubuntu/
install-docker-ubuntu:
	sudo apt remove $(dpkg --get-selections docker.io docker-compose docker-compose-v2 docker-doc docker-buildx podman-docker containerd runc | cut -f1)	
	sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

start-docker-ubuntu:
	sudo systemctl start docker

stop-docker-ubuntu:
	sudo systemctl start stop

status-docker-ubuntu:
	sudo systemctl status docker

start-ssh-server:
	sudo apt update
	sudo apt install -y openssh-server
	sudo systemctl enable --now ssh

start-nginx:
	sudo apt update
	sudo apt install nginx -y
	sudo systemctl start nginx