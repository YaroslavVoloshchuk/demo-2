resource "aws_instance" "jenkins_server" {
  ami                         = var.aws_instance_ami # Ubuntu 20.4
  instance_type               = var.aws_instance_type_jenkins_server # Тип серверу
  key_name                    = "aws_demo"
  vpc_security_group_ids      = [aws_security_group.jenkins_server.id]
  subnet_id                   = aws_subnet.digichlist_public.id # публічна підмережа
  private_ip                  = var.aws_instance_public_ip_Jenkins
  associate_public_ip_address = true
  tags = {
    Name = "Jenkins Server"
  }

  provisioner "file" {
    source      = "scripts/jenkins.sh"
    destination = "/home/ubuntu/jenkins.sh"
  }
  provisioner "remote-exec" {
    inline = [
      "chmod +x /home/ubuntu/jenkins.sh",
      "sudo /home/ubuntu/jenkins.sh",
    ]
  }

  
  connection {
    type        = "ssh"
    user        = "ubuntu"
    password    = ""
    private_key = file("/home/bamik/.ssh/aws_demo.pem")
    host        = self.public_ip
  }
}


#  resource "aws_eip" "jenkins_server" {
#    vpc      = true
#  	instance = aws_instance.jenkins_server.id
#  	associate_with_private_ip = "10.0.5.5"
#  	depends_on = [aws_internet_gateway.digichlist_igw]
#  }

resource "aws_security_group" "jenkins_server" {
  name        = "jenkins Security Group"
  description = "jenkins security group"
  vpc_id      = aws_vpc.digichlist_VPC.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

    ingress {
    from_port   = 9000
    to_port     = 9000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "jenkins"
  }
}
