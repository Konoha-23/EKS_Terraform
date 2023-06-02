variable "vpc_id" {
    description = "VPC ID"
    type = string
    default = "vpc-09197b987aa76063d"  
}

variable "public_subnet_id_1" {
    description = "Public Subnet ID 1"
    type = string
    default = "subnet-05b67e7ba14926c22"
}

variable "public_subnet_id_2" {
    description = "Public Subnet ID 1"
    type = string
    default = "subnet-0eb7e9fc0fdc516ff"
}

variable "private_subnet_id_1" {
    description = "Public Subnet ID 1"
    type = string
    default = "subnet-0610abf43d836d467"
}

variable "private_subnet_id_2" {
    description = "Public Subnet ID 1"
    type = string
    default = "subnet-0aaf6363b51fe083f"
}

variable "vpc_security_group_id" {
    description = "Security Group ID"
    type = list(string)
    default = [ "sg-087c5f44d2b513997" ]  
}

variable "Practice_Public_Instance_ID" {
    description = "ID for Practice_Public Instance"
    type = string
    default = "i-039dbcdd188bcaecc"
}

variable "Practice_Private_Instance_ID" {
    description = "ID for Practice_Private Instance"
    type = string
    default = "i-0da3b103016388056"
}

variable "Target_Group_Arn" {
    description = "ID for Practice_Private Instance"
    type = string
    default = "arn:aws:elasticloadbalancing:us-east-1:083772204804:targetgroup/pref-20230602140331899200000002/21088ba466983875-20230602141029673600000002"
}
