#VPC & Security Group Outputs

#VPC OUTPUTS

output "vpc_id" {
    description = "Practice VPC ID"
    value = module.vpc.vpc_id
}

output "public_subnet_ids" {
    description = "Public Subnet IDS for Practice VPC"
    value = module.vpc.public_subnets
}

output "private_subnet_ids" {
    description = "Private Subnet IDs for Practice VPC"
    value = module.vpc.private_subnets 
}

#Security Group Output 
    
output "vpc_security_group_id" {
    description = "Private Subnet IDs for Practice VPC"
    value = module.security-group.security_group_id
}
    
#Instance Outputs
    
output "Practice_Public_Instance_ID" {
    description = "ID for Practice_Public Instance"
    value = aws_instance.Practice_Public.id
}

output "Practice_Private_Instance_ID" {
    description = "ID for Practice_Private Instance"
    value = aws_instance.Practice_Private.id  
}

