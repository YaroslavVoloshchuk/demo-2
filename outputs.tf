output "jenkins_id" {
  description = "ID of the Jenkins"
  value       = aws_instance.jenkins_server.id
}
output "jenkins_public_ip" {
  description = "Public IP address of the jenkins"
  value       = aws_instance.jenkins_server.public_ip
}
###############################

# output "frontend_id" {
#   description = "ID of the FrontEnd"
#   value       = aws_instance.FrontEnd_server.id
# }
# output "frontend_public_ip" {
#   description = "Public IP address of the FrontEnd"
#   value       = aws_instance.FrontEnd_server.public_ip
# }
###############################
#output "database_id" {
#  description = "ID of the DataBase"
#  value       = aws_instance.DB_server.id
#}
#output "public_ip_database" {
#  description = "Public IP address of the DataBase"
#  value       = aws_instance.DB_server.public_ip
#}
# ###############################
# output "backend_server_1_id" {
#   description = "ID of the BackEnd-1"
#   value       = aws_instance.backend_server_1.id
# }
# output "public_ip_backend-1" {
#   description = "Public IP address of the BackEnd-1"
#   value       = aws_instance.backend_server_1.public_ip
# }
# ###############################
# output "backend_server_2_id" {
#   description = "ID of the BackEnd-2"
#   value       = aws_instance.backend_server_2.id
# }
# output "public_ip_backend-2" {
#   description = "Public IP address of the BackEnd-2"
#   value       = aws_instance.backend_server_2.public_ip
# }
# # ###############################
# output "bastion_server_id" {
#   description = "ID of the Bastion"
#   value       = aws_instance.bastion_server.id
# }
# output "public_ip_bastion" {
#   description = "Public IP address of the Bastion"
#   value       = aws_instance.bastion_server.public_ip
# }
###############################
output "IGW_id" {
	description = "ID of the IGW"
	value = aws_internet_gateway.digichlist_igw.id
}
###############################
 # output "digichlist_nat" {
 # 	description = "ID of the NAT"
 # 	value = aws_eip.digichlist_nat.id
 # }
###############################
output "digichlist_vpc" {
	description = "ID of the VPC"
	value = aws_vpc.digichlist_VPC.id
}
###############################
output "digichlist_subnet_public" {
	description = "ID of the public subnet"
	value = aws_subnet.digichlist_public.id
}
###############################
output "digichlist_subnet_private" {
	description = "ID of the private subnet"
	value = aws_subnet.digichlist_private.id
}
###############################
#output "aws_eip_jenkins" {
#	description = "Elastic IP of the Jenkins server"
#	value = aws_eip.jenkins_server.id
#}
###############################
