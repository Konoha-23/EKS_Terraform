# terra-modules
Custom modules for Terraform

 Install Terraform on Ubuntu
 
 #awscli installation
 sudo apt update -y
 sudo apt install unzip
 curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
 unzip awscliv2.zip
 sudo ./aws/install -y
 
 #kubectl
 sudo curl -O https://s3.us-west-2.amazonaws.com/amazon-eks/1.25.9/2023-05-11/bin/darwin/amd64/kubectl
 sudo chmod +x ./kubectl
 sudo mv ./kubectl /usr/local/bin/kubectl
 kubectl version --short
 
 #terraform
 $sudo apt-get update && sudo apt-get install -y gnupg software-properties-common curl
 $curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
 $sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
 $sudo apt-get update && sudo apt-get install terraform
