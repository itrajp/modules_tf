resource "aws_instance" "example" {
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = var.INST
  #vpc_id = var.vpc_id
  # the VPC subnet
  subnet_id = var.subnet_id

  # the security group
  vpc_security_group_ids = var.vpc_security_group_ids

  # the public SSH key
  key_name = aws_key_pair.mykeypair.key_name
  provisioner "file" {
    source = "apache.sh"
    destination = "/tmp/script.sh"
  }
  provisioner "remote-exec" {
    inline = [
      "chmod +x /temp/script.sh",
      "sudo sed -i -e 's/\r$//' /tmp/script.sh",
      "sudo /temp/script.sh",
    ]
  
  }
  #user_data = file("apache.sh")
		
}

resource "aws_key_pair" "mykeypair" {
  key_name   = var.mykey
  public_key = file(var.PATH_TO_PUBLIC_KEY)
}
