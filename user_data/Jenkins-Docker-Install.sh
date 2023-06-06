#Jenkins and Docker Installation with java open-jdk in ec2 resource configuration "user_data = file("${path.module}/user_data/Jenkins-Docker-Install.sh")"          
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




