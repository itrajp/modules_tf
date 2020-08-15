variable "RDS_PASSWORD"{
    default = "myrdspwd123"
}
variable "engine"{
    default = "mysql"
}
variable "subnet_ids"{
    type = list(string)
    default = ["pub_subnet_1","pri_subnet_1","pub_subnet_2","pri_subnet_2"]
}
variable "vpc_security_group_ids"{
    type = list(string)
    default = []
}
variable "availability_zone"{}

