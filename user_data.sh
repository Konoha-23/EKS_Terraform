#! /bin/bash
sudo apt update -y
sudo apt install awscli -y
sudo apt-get update && sudo apt-get install -y gnupg software-properties-common
wget -O- https://apt.releases.hashicorp.com/gpg | \
gpg --dearmor | \
sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update
sudo apt-get install terraform


---
#! /bin/bash
sudo apt update -y
sudo apt install awscli -y
sudo adduser ansible
echo "ansible:ansible" | chpasswd
echo "ansible ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/ansible
sudo su - ansible
sudo hostnamectl set-hostname ansible
sudo apt-add-repository ppa:ansible/ansible #Needed to get /etc/ansible files e.g ansible.cfg
sudo apt install ansible -y
sudo sed -i "/^[^#]*PasswordAuthentication[[:space:]]no/c\PasswordAuthentication yes" /etc/ssh/sshd_config
sudo service sshd restart
