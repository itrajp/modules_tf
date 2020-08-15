variable "cidr"{
    default = "10.0.0.0/16"
}
variable "tenancy"{
    default = "default"
}
variable "dns_sup"{
    default = "true"
}
variable "dns_hname"{
    default = "true"
}
variable "e_classiclink"{
    default = "false"
}
variable "subnet_ids"{
    type = list(string)
    default = []
}
variable "vpc_security_group_ids"{
    type = list(string)
    default = []
}