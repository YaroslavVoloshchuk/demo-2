resource "aws_internet_gateway" "digichlist_igw" {
  vpc_id = aws_vpc.digichlist_VPC.id

  tags = {
    Name = "digichlist - Internet Gateway"
  }
}
