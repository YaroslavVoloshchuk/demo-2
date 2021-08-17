resource "aws_route_table" "digichlist_subnet_public" {
  vpc_id = aws_vpc.digichlist_VPC.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.digichlist_igw.id
  }
  tags = {
    Name = "digichlist Route Table_public"
  }
}

resource "aws_route_table_association" "digichlist_subnet_public" {
  subnet_id      = aws_subnet.digichlist_public.id
  route_table_id = aws_route_table.digichlist_subnet_public.id
}


resource "aws_route_table" "digichlist_subnet_private" {
  vpc_id = aws_vpc.digichlist_VPC.id
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.digichlist_ngw.id
    #gateway_id = aws_internet_gateway.digichlist_igw.id
  }
  tags ={
    Name = "digichlist Route Table_private"
  }
}

resource "aws_route_table_association" "digichlist_subnet_private" {
  subnet_id = aws_subnet.digichlist_private.id
  route_table_id = aws_route_table.digichlist_subnet_private.id
}


resource "aws_route_table" "digichlist_subnet_public_1b" {
  vpc_id = aws_vpc.digichlist_VPC.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.digichlist_igw.id
  }
  tags = {
    Name = "digichlist Route Table_public_1b"
  }
}

resource "aws_route_table_association" "digichlist_subnet_public_1b" {
  subnet_id      = aws_subnet.digichlist_public_1b.id
  route_table_id = aws_route_table.digichlist_subnet_public.id
}


resource "aws_route_table" "digichlist_subnet_private_1b" {
  vpc_id = aws_vpc.digichlist_VPC.id
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.digichlist_ngw.id
    #gateway_id = aws_internet_gateway.digichlist_igw.id
  }
  tags ={
    Name = "digichlist Route Table_private_1b"
  }
}

resource "aws_route_table_association" "digichlist_subnet_private_1b" {
  subnet_id = aws_subnet.digichlist_private_1b.id
  route_table_id = aws_route_table.digichlist_subnet_private.id
}
