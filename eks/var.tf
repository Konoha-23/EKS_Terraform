variable "cluster_name" {
  type        = string
  description = "Cluster Name"
  default     = "SSJ2"
}

variable "cluster_version" {
  type        = number
  description = "Cluster Version"
  default     = "1.27"
}

variable "cluster_vpc_id" {
  type        = string
  description = "Cluster Name"
  default     = ""
}

variable "cluster_subnet_ids" {
  type        = list(string)
  description = "Private and Public Subset IDs for Cluster Nodegroups and Load Balancers"
  default     = [""]
  
}

variable "cluster_private_subnet_ids" {
  type        = list(string)
  description = "Private and Public Subset IDs for Cluster Nodegroups and Load Balancers"
  default     = [""]
  
}

variable "cluster_additional_security_group_ids" {
  type        = list(string)
  description = "Security Group for Cluster with default http, https, prometheus, etc ports"
  default     = [""]
}

variable "cluster_endpoint" {
  type        = string
  description = "Cluster EndPoint"
  default     = ""
}

variable "cluster_certificate_authority_data" {
  type        = string
  description = "cluster_certificate_authority_data"
  default     = ""
}

#Managed NodeGroup
variable "instance_types" {
  type        = list(string)
  description = "Instance types for Managed Node Group"
  default     = ["t2.medium", "t2.medium", "t2.medium", "t2.medium"]
}

variable "key_name" {
  type        = string
  description = "Cluster Name"
  default     = "pipeline"
}
