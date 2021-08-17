# resource "aws_instance" "backend_server_1" {
#   ami                         = var.aws_instance_ami # Ubuntu 20.4
#   instance_type               = var.aws_instance_type
#   key_name                    = "aws_demo"
#   user_data                   = file("scripts/backend.sh")
#   vpc_security_group_ids      = [aws_security_group.backend_server.id]
#   subnet_id                   = aws_subnet.digichlist_private.id
#   private_ip                  = var.aws_instance_privat_ip_BackEnd_1
#   associate_public_ip_address = true
#   tags = {
#     Name = "Backend_1 server"
#   }
# }
#
# resource "aws_instance" "backend_server_2" {
#   ami                         = var.aws_instance_ami # Ubuntu 20.4
#   instance_type               = var.aws_instance_type
#   key_name                    = "aws_demo"
#   user_data                   = file("scripts/backend.sh")
#   vpc_security_group_ids      = [aws_security_group.backend_server.id]
#   subnet_id                   = aws_subnet.digichlist_private.id
#   private_ip                  = var.aws_instance_privat_ip_BackEnd_2
#   associate_public_ip_address = true
#   tags = {
#     "Name" = "Backend_2 server"
#   }
# }
#
# resource "aws_security_group" "backend_server" {
#   name        = "BackEnd Security Group"
#   description = "BE security group"
#   vpc_id      = aws_vpc.digichlist_VPC.id
#   ingress {
#     from_port   = 22
#     to_port     = 22
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
#
#   ingress {
#     from_port   = 80
#     to_port     = 80
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
#   ingress {
#     from_port   = 443
#     to_port     = 443
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
#   ingress {
#     from_port   = 5000
#     to_port     = 5000
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
#   tags = {
#     Name = "backend"
#   }
# }
