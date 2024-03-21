#Jenkins Installation with installation of Java jdk

#! /bin/bash
sudo hostnamectl set-hostname jenkins
sudo timedatectl set-timezone America/Los_Angeles
sudo adduser jenkins
sudo echo "jenkins ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/jenkins
sudo su - jenkins
sudo chown jenkins:jenkins -R /etc/ssh/sshd_config
sudo sed -i "/^[^#]*PasswordAuthentication[[:space:]]no/c\PasswordAuthentication yes" /etc/ssh/sshd_config
sudo service ssh restart
sudo apt update -y
sudo apt install openjdk-17-jdk -y
sudo apt install wget -y
sudo apt update -y
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update -y
sudo apt-get install jenkins -y
sudo apt update -y 
sudo apt install jenkins -y
sudo systemctl start jenkins
sudo apt update -y

