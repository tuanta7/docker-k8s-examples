# https://github.com/Homebrew/brew/releases/tag/7.0.7
install-brew:
	curl -L -O https://github.com/Homebrew/brew/releases/download/7.0.7/Homebrew.pkg
	sudo installer -pkg ./Homebrew.pkg -target /
	rm ./Homebrew.pkg

# https://k9scli.io/topics/install/
install-k9s:
	brew install derailed/k9s/k9s

# https://kubernetes.io/vi/docs/tasks/tools/install-minikube/
install-minikube:
	brew install minikube
