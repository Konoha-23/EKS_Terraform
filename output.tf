#VPC & Security Group Outputs

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
  
output "vpc_security_group_id" {
    description = "Private Subnet IDs for Practice VPC"
    value = module.security-group.security_group_id
}

