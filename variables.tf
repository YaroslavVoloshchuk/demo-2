variable "aws_region" {
  default = "us-east-1"
}
variable "availability_zone" {
  default = "us-east-1a"
}

variable "availability_zone_2" {
  default = "us-east-1b"
}


variable "aws_key_path" {
  default  = "/home/bamik/.ssh/aws_demo.pem"
}

variable "access_key" {
  default  = "AKIA5ERRQRSRLATYGOMJ"

}

variable "secret_key" {
  default  = "E0X7tn9novFi+/T3UE3sfb/kHAvOQejs793oO33x"
}

variable "aws_instance_ami" {
  default = "ami-042e8287309f5df03"
}


variable "aws_instance_type" {
  default = "t2.micro"
}
variable "aws_instance_type_jenkins_server" {
  default = "t2.micro" #default = "t2.medium"
}
variable "aws_instance_type_frontend_server" {
  default = "t2.micro"
}
############################################
variable "aws_vpc" {
  default = "10.0.0.0/21"
}

variable "aws_subnet_public" {
  default = "10.0.5.0/25"
}
variable "aws_subnet_private" {
  default = "10.0.6.0/25"
}
###########################################


variable "aws_instance_privat_ip_BackEnd_1" {
  default = "10.0.6.5"
}
variable "aws_instance_privat_ip_BackEnd_2" {
  default = "10.0.6.6"
}
# variable "aws_instance_public_ip_bastion" {
#   default = "10.0.5.10"
# }
# variable "aws_instance_privat_ip_DataBase" {
#   default = "10.0.6.4"
# }
variable "aws_instance_public_ip_FrontEnd" {
  default = "10.0.5.6"
}
# variable "aws_instance_public_ip_LoadBalancer" {
#   default = "10.0.5.7"
# }
variable "aws_instance_public_ip_Jenkins" {
  default = "10.0.5.5"
}
