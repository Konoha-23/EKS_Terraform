resource "aws_instance" "Practice_Public" {
    ami = "ami-053b0d53c279acc90"
    instance_type = "t2.micro"
    key_name = "EKS"
    subnet_id = var.public_subnet_id_1
    availability_zone = "us-east-1a"
    vpc_security_group_ids = var.vpc_security_group_id
    associate_public_ip_address = true
    tags = {
      "name" = "Practice_Public" 
    }  
}

resource "aws_instance" "Practice_Private" {
    ami = "ami-053b0d53c279acc90"
    instance_type = "t2.micro"
    key_name = "EKS"
    subnet_id = var.private_subnet_id_2
    availability_zone = "us-east-1b"
    vpc_security_group_ids = var.vpc_security_group_id
    associate_public_ip_address = true
    tags = {
      "name" = "Practice_Private" 
    }  
}

#Pipeline

resource "aws_instance" "Ansible" {
    ami = var.ami_id
    instance_type = var.ansible_instance_type
    key_name = "pipeline"
    subnet_id = var.public_subnet_ids
    availability_zone = var.availability_zone
    vpc_security_group_ids = [var.default_security_group_id]
    associate_public_ip_address = true
    user_data = file("${path.module}/ansible-install-ubuntu.sh")          
    tags = {
      "name" = "Ansible" 
    }  
}

resource "aws_instance" "Jenkins" {
    ami = var.ami_id
    instance_type = var.ansible_instance_type
    key_name = "pipeline"
    subnet_id = var.public_subnet_ids
    availability_zone = var.availability_zone
    vpc_security_group_ids = [var.default_security_group_id,  var.Jenkins_security_group_id]
    associate_public_ip_address = true
    user_data = file("${path.module}/jenkins-install-ubuntu.sh")          
    tags = {
      "name" = "Jenkins" 
    }  
}

resource "aws_eip" "Jenkins_EIP" {
  instance = aws_instance.Jenkins.id
}

resource "aws_instance" "Docker" {
    ami = var.ami_id
    instance_type = var.ansible_instance_type
    key_name = "pipeline"
    subnet_id = var.public_subnet_ids
    availability_zone = var.availability_zone
    vpc_security_group_ids = [var.default_security_group_id]
    associate_public_ip_address = true         
    tags = {
      "name" = "Docker" 
    }  
}

resource "aws_eip" "Docker_EIP" {
  instance = aws_instance.Docker.id
}

resource "aws_instance" "Sonar" {
    ami = var.ami_id
    instance_type = var.ansible_instance_type
    key_name = "pipeline"
    subnet_id = var.public_subnet_ids
    availability_zone = var.availability_zone
    vpc_security_group_ids = [var.default_security_group_id]
    associate_public_ip_address = true         
    tags = {
      "name" = "Sonar" 
    }  
}

resource "aws_eip" "Sonar_EIP" {
  instance = aws_instance.Sonar.id
}

resource "aws_instance" "Nexus" {
    ami = var.nexus_ami_id
    instance_type = var.ansible_instance_type
    key_name = "pipeline"
    subnet_id = var.public_subnet_ids
    availability_zone = var.availability_zone
    vpc_security_group_ids = [var.default_security_group_id]
    associate_public_ip_address = true         
    tags = {
      "name" = "Nexus" 
    }  
}

resource "aws_eip" "Nexus_EIP" {
  instance = aws_instance.Nexus.id
}

