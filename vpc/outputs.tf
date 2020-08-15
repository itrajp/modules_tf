output "vpc_id"{
    value = aws_vpc.main.id
}
output "pub_subnet_1"{
    value = aws_subnet.main-public-1.id 
}
output "pub_subnet_2"{
    value = aws_subnet.main-public-2.id
}
output "pri_subnet_1"{
    value = aws_subnet.main-private-1.id
}
output "pri_subnet_2"{
    value = aws_subnet.main-private-2.id
}
output "inst_sg_id"{
    value = aws_security_group.example-instance.id
}
output "rds_sg_id"{
    value = aws_security_group.allow-mysql.id
}
output "rds_az"{
    value = aws_subnet.main-private-1.availability_zone
}
