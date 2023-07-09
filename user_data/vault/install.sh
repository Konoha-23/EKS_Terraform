Vault Installation Ref: https://developer.hashicorp.com/vault/tutorials/getting-started/getting-started-install
Hashicorp Package Installer Ref: https://www.hashicorp.com/official-packaging-guide

If GPG keyring and hashicorp repo are already installed, you can skip those steps.

---
#! /bin/bash
sudo adduser vault
sudo echo "vault ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/vault
sudo su - vault
sudo hostnamectl set-hostname terraform
sudo chown vault:vault -R /etc/ssh/sshd_config
sudo apt update -y && sudo apt install gpg
sudo wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
sudo gpg --no-default-keyring --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg --fingerprint
sudo echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update -y
sudo apt install vault

---
#! /bin/bash
sudo apt update && sudo apt install gpg
sudo wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
sudo gpg --no-default-keyring --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg --fingerprint
sudo echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update
sudo apt install vault

AWS Secrets Ref: https://developer.hashicorp.com/terraform/tutorials/secrets/secrets-vault?utm_offer=ARTICLE_PAGE&utm_medium=WEB_IO&utm_content=DOCS&utm_source=WEBSITE

Helm Kubernetes Ref: https://developer.hashicorp.com/vault/tutorials/kubernetes/kubernetes-amazon-eks
