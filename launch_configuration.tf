resource "aws_launch_configuration" "digichlist_lc_fe" {
  name_prefix   = "terraform-digichlist_lc-fe"
  image_id      = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  key_name = "aws_demo"
  associate_public_ip_address = true
  security_groups = [aws_security_group.digichlist_fe_lc.id]
  depends_on = [aws_security_group.digichlist_fe_lc]
  user_data = templatefile("scripts/userdata-fe.sh.tpl",
    {
      access = var.access_key,
      secret = var.secret_key,

  })

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_launch_configuration" "digichlist_lc_be" {
  name_prefix   = "terraform-digichlist_lc-be"
  image_id      = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  key_name = "aws_demo"
  associate_public_ip_address = true
  security_groups = [aws_security_group.digichlist_be_lc.id]
  depends_on = [aws_security_group.digichlist_be_lc]
  user_data = templatefile("scripts/userdata-be.sh.tpl",
    {
      access = var.access_key,
      secret = var.secret_key,

  })

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_security_group" "digichlist_fe_lc" {
  name        = "LC_FE Security Group"
  description = "Launch configuration frontend security group"
  vpc_id      = aws_vpc.digichlist_VPC.id
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 5000
    to_port     = 5000
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
    Name = "lc_fe"
  }
}

  resource "aws_security_group" "digichlist_be_lc" {
    name        = "LC_BE Security Group"
    description = "Launch configuration backend security group"
    vpc_id      = aws_vpc.digichlist_VPC.id
    ingress {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
      from_port   = 5000
      to_port     = 5000
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
      from_port   = 443
      to_port     = 443
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
      Name = "lc_fe"
    }
}
