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

