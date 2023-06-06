# terra-modules
Custom modules for Terraform

 Install Terraform on Ubuntu
 
 #awscli installation
 sudo apt update -y
 sudo apt install awscli -y
 
 #terraform
 $sudo apt-get update && sudo apt-get install -y gnupg software-properties-common curl
 $curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
 $sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
 $sudo apt-get update && sudo apt-get install terraform
