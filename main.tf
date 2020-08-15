provider "aws"{
  region = var.AWS_REGION
  profile = "default"  
}
terraform{
  required_version = ">=0.12"
}
module "vpc"{
  source = "./vpc"
  cidr           = "10.0.0.0/16"
  tenancy     = "default"
  dns_sup   ="true"
  dns_hname = "true"
  e_classiclink   = "false"
}
module "ec2"{
  source = "./ec2"
  INST = "t2.micro"
  mykey = "my_tf_keypair"
  vpc_id = module.vpc.vpc_id
  subnet_id = module.vpc.pub_subnet_1
  vpc_security_group_ids = [module.vpc.inst_sg_id]

}
module "rds"{
  source = "./rds"
  engine  = "mysql"
 # vpc_id =  module.vpc.vpc_id
  availability_zone = module.vpc.rds_az
  subnet_ids = [module.vpc.pri_subnet_1]
  vpc_security_group_ids =  [module.vpc.rds_sg_id]
}