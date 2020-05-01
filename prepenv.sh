#!/bin/bash

# GoLang
sudo apt-get update && sudo apt-get install golang
# Docker
sudo apt-get update && sudo apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common && curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - && sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" && sudo apt-get update && sudo apt-get install docker-ce docker-ce-cli containerd.io

# Compose
#sudo curl -L "https://github.com/docker/compose/releases/download/1.25.5/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && chmod +x /usr/local/bin/docker-compose 

# Kind
curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.7.0/kind-$(uname)-amd64 && chmod +x ./kind && mv ./kind /usr/local/bin

# Kubectl
curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl && chmod +x ./kubectl && sudo mv ./kubectl /usr/local/bin/kubectl && kubectl version --client

# KBashCompletion
apt-get install bash-completion && echo "source <(kubectl completion bash)" >> ~/.bashrc && kubectl completion bash > /etc/bash_completion.d/kubectl && echo 'alias k=kubectl' >> ~/.bashrc && echo 'complete -F __start_kubectl k' >> ~/.bashrc