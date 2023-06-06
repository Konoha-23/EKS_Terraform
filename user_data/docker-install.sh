#Jenkins and Docker Installation with java open-jdk in ec2 resource configuration "user_data = file("${path.module}/user_data/Docker-Install.sh")" 
#!/bin/bash
sudo hostname docker
sudo apt update -y 
sudo apt install docker.io -y
sudo usermod -aG docker ubuntu 
sudo systemctl restart docker.service
