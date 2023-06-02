variable "ingress_rules" {
    description = "Ingress Rules for http 80, https 443, ssh"
    type = list(string)
    default = ["ssh-tcp", "http-80-tcp", "https-443-tcp"]  
}

variable "ingress_cidr_blocks" {
    description = "Ingress Cidr Blocks"
    type = list(string)
    default = ["10.0.3.0/24"]
}
