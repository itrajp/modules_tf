variable "AWS_REGION" {
  default = "us-east-1"
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "mykey"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "mykey.pub"
}

variable "AMIS" {
  type = map(string)
  default = {
    us-east-1 = "ami-13be557e"
  }
}
variable "subnet_ids"{
    type = list(string)
    default = []
}
variable "vpc_security_group_ids"{
    type = list(string)
    default = []
}