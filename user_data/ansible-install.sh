#Ansible Installation. Use in ec2 resource configuration via "user_data = file("${path.module}/user_data/ansible-install.sh")          "
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

