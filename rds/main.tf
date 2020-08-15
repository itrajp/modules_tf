resource "aws_db_instance" "mysql"{
  allocated_storage       = 20 # 20 GB of storage, gives us more IOPS than a lower number
  engine                  = var.engine
  engine_version          = "5.7.22"
  instance_class          = "db.t2.micro" 
  identifier              = "tf-mysql"
  name                    = "my_mysql"
  username                = "root"           
  password                = var.RDS_PASSWORD 
  db_subnet_group_name    = aws_db_subnet_group.mysql-subnet.name
  parameter_group_name    = aws_db_parameter_group.mysql-parameters.name
  multi_az                = "false" 
  vpc_security_group_ids  = var.vpc_security_group_ids
  storage_type            = "gp2"
  backup_retention_period = 0                                          
  availability_zone       = var.availability_zone# prefered AZ
  skip_final_snapshot     = true                                        
  tags = {
    Name = "tf_mysql-instance"
  }
}

resource "aws_db_subnet_group" "mysql-subnet" {
  name        = "mysql-subnet"
  description = "tf RDS subnet group"
  subnet_ids  =  var.subnet_ids
}

resource "aws_db_parameter_group" "mysql-parameters" {
  name        = "mysql-parameters"
  family      = "mysql5.6"
  description = "MYSQL parameter group"
 
   # name  = "max_allowed_packet"
    #value = "16777216"
  #}
}
