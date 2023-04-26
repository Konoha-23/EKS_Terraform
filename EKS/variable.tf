variable "cluster_name" {
    description = "Name of Cluster"
    type = string
    default = "Hogwarts"
}

variable "cluster_version" {
    description = "EKS Cluster Version"
    type = number
    default = "1.24"
  
}

#variable "cluster_role" {
 #   description = "Role ID For Cluster"
  #  type = string
   # default = "arn:aws:iam::083772204804:role/EKS"
#}

variable "vpc_security_group_id" {
    description = "EKS-4 security group id"
    type = list(string)
    default = ["sg-0e4fdbbceb669c049"]
  
}

variable "subnet_ids" {
    description = "EKS VPC ID"
    type = list(string)
    default = ["subnet-01c8aa22c96ffe76b", "subnet-0ea37024c6b112d17"]
}

variable "node_group_name" {
    description = "Node Group Name"
    type = string
    default = "worker"
}
