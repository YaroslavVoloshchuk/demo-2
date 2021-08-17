resource "aws_subnet" "digichlist_public" {
  vpc_id            = aws_vpc.digichlist_VPC.id
  cidr_block        = var.aws_subnet_public
  availability_zone = var.availability_zone


  tags = {
    Name = "digichlist subnet_public"
	Access = "public"
  }
}
resource "aws_subnet" "digichlist_private" {
  vpc_id            = aws_vpc.digichlist_VPC.id
  cidr_block        = var.aws_subnet_private
  availability_zone = var.availability_zone


  tags = {
    Name = "digichlist subnet_private"
	Access = "private"
  }
}

resource "aws_subnet" "digichlist_public_1b" {
  vpc_id            = aws_vpc.digichlist_VPC.id
  cidr_block        = "10.0.1.0/25"
  availability_zone = "us-east-1b"


  tags = {
    Name = "digichlist subnet_public_1b"
	Access = "public"
  }
}
resource "aws_subnet" "digichlist_private_1b" {
  vpc_id            = aws_vpc.digichlist_VPC.id
  cidr_block        = "10.0.2.0/25"
  availability_zone = "us-east-1b"


  tags = {
    Name = "digichlist subnet_private_1b"
	Access = "private"
  }
}
