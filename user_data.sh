#Terraform installation. Input in aws management console

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

#Ansible Installation
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

---
#Jenkins Installation with installation of Java jdk
#! /bin/bash
sudo apt update -y
sudo apt install openjdk-11-jdk -y
sudo apt install wget -y
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt update
sudo apt install jenkins -y
sudo systemctl start jenkins
sudo echo "jenkins ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/jenkins
sudo su - jenkins

---
#Jenkins and Docker Installation with java open-jdk
#!/bin/bash
sudo hostname docker
sudo apt update -y 
sudo apt install docker.io -y
sudo usermod -aG docker ubuntu 
sudo apt install wget -y
sudo apt update -y
sudo apt install openjdk-11-jdk -y
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt update
sudo apt install jenkins -y
sudo systemctl start jenkins
sudo echo "jenkins ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/jenkins
sudo usermod -aG docker jenkins
sudo su - jenkins
sudo chown jenkins /var/run/docker.sock
sudo systemctl restart docker.service

