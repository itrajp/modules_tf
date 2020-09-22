variable "AWS_REGION" {
  default = "us-east-1"
}
variable "AMIS" {
  type = map(string)
  default = {
    us-east-1 = "ami-00514a528eadbc95b"
  }
}
variable "PATH_TO_PRIVATE_KEY" {
  default = "mykey"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "mykey.pub"
}
variable "INST"{
    default = "t2.micro"
}
variable "mykey"{
    default = "my_tf_keypair"
}
variable "vpc_id"{}
variable "subnet_id"{}
variable "vpc_security_group_ids"{
  type = list(string)
  default = []
}
