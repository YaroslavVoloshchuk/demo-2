# resource "aws_instance" "FrontEnd_server" {
#   ami                         = var.aws_instance_ami # Ubuntu 20.4
#   instance_type               = var.aws_instance_type_frontend_server
#   key_name                    = "aws_demo"
#   user_data                   = file("scripts/frontend.sh")
#   vpc_security_group_ids      = [aws_security_group.FrontEnd_server.id]
#   subnet_id                   = aws_subnet.digichlist_public.id
#   private_ip                  = var.aws_instance_public_ip_FrontEnd
#   associate_public_ip_address = true
#   tags = {
#     Name = "Frontend Server"
#   }
# }
#
# #resource "aws_eip" "frontend_server" {
# #  vpc      = true
# #	instance = aws_instance.FrontEnd_server.id
# #	associate_with_private_ip = "10.0.5.6"
# #	depends_on = [aws_internet_gateway.digichlist_igw]
# #}
#
# resource "aws_security_group" "FrontEnd_server" {
#   name        = "FrontEnd Security Group"
#   description = "FE security group"
#   vpc_id      = aws_vpc.digichlist_VPC.id
#   ingress {
#     from_port   = 80
#     to_port     = 80
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
#   ingress {
#     from_port   = 22
#     to_port     = 22
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
#   ingress {
#     from_port   = 443
#     to_port     = 443
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
#
#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
#   tags = {
#     Name = "frontend"
#   }
# }
