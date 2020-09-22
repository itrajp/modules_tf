resource "aws_key_pair" "mykeypair" {
  key_name   = var.mykey
  public_key = file(var.PATH_TO_PUBLIC_KEY)
  }
resource "aws_instance" "example" {
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = var.INST
  subnet_id = var.subnet_id
  vpc_security_group_ids = var.vpc_security_group_ids
  user_data = <<EOF
          #!/bin/bash
          sudo yum update -y
          sudo yum upgrade -y
          sudo yum install httpd -y
          sudo service httpd start
          echo "<h1> Deployed via terraform ***Priyadarshini Itraj*** </h1>" | sudo tee /var/www/html/index.html
  EOF
  tags = {
    "Name" = "rds_vpc_mod_webserver"
  }
  }    
