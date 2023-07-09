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
    
output "default_security_group_id" {
    description = "Default Security Group ID"
    value = module.Default.security_group_id
}

output "Jenkins_security_group_id" {
    description = "Jenkins Security Group ID"
    value = module.Jenkins.security_group_id
}

output "sonar_security_group_id" {
    description = "SonarQube Security Group ID"
    value = module.Sonar.security_group_id
}

output "Nexus_security_group_id" {
    description = "Nexus Security Group ID"
    value = module.Nexus.security_group_id
}

#EIP
output "Jenkins_EIP" {
    description = "Jenkins_EIP"
    value = aws_eip.Jenkins_EIP.public_ip
}

output "Docker_EIP" {
    description = "Docker EIP"
    value = aws_eip.Docker_EIP.public_ip
}

output "Sonar_EIP" {
    description = "Sonar EIP"
    value = aws_eip.Sonar_EIP.public_ip
}

output "Nexus_EIP" {
    description = "Nexus EIP"
    value = aws_eip.Nexus_EIP.public_ip
}
