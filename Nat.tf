resource "aws_eip" "digichlist_nat" {
  vpc      = true
  }

resource "aws_nat_gateway" "digichlist_ngw" {
  allocation_id = aws_eip.digichlist_nat.id
  subnet_id = aws_subnet.digichlist_public.id
}
