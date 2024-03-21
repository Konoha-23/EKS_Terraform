#Jenkins and Docker Installation with java open-jdk in ec2 resource configuration "user_data = file("${path.module}/user_data/Jenkins-Docker-Install.sh")"          
#!/bin/bash
sudo hostname docker
sudo adduser jenkins
sudo adduser docker
sudo su - jenkins
sudo apt update -y  
sudo apt install wget -y
sudo apt update -y
sudo apt install openjdk-17-jdk -y
sudo apt update -y
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt update -y
sudo apt install jenkins -y
sudo systemctl start jenkins
sudo echo "jenkins ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/jenkins
sudo apt install docker.io -y
sudo usermod -aG docker jenkins
sudo chown jenkins /var/run/docker.sock
sudo systemctl restart docker.service




