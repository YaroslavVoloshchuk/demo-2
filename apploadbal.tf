resource "aws_lb" "app_lb" {
  name               = "digichlist-ALB"
  load_balancer_type = "application"
  security_groups = [aws_security_group.digichlist_alb.id]
  subnets         = [aws_subnet.digichlist_public.id, aws_subnet.digichlist_public_1b.id]

}

resource "aws_lb_listener" "app_lb_listener_redirect" {
  load_balancer_arn = aws_lb.app_lb.arn

  port     = 80
  protocol = "HTTP"

  default_action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}

resource "aws_lb_listener" "app_lb_listener_front" {
  load_balancer_arn = aws_lb.app_lb.arn

  port     = 443
  protocol = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = "arn:aws:acm:us-east-1:903120719010:certificate/64d5736e-9ca0-49fe-9650-0768ef1d5969"

  default_action {
    target_group_arn = aws_lb_target_group.target_group_fe.arn
    type             = "forward"
  }
}

resource "aws_lb_listener" "app_lb_listener_be" {
  load_balancer_arn = aws_lb.app_lb.arn

  port     = 5000
  protocol = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = "arn:aws:acm:us-east-1:903120719010:certificate/64d5736e-9ca0-49fe-9650-0768ef1d5969"
 
  default_action {
    target_group_arn = aws_lb_target_group.target_group_be.arn
    type             = "forward"
  }
}

resource "aws_security_group" "digichlist_alb" {
  name = "digichlist_lb"
  description = "Security Group"

  dynamic "ingress" {
    for_each = ["80", "443", "5000"]
    content {
      from_port = ingress.value
      to_port = ingress.value
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
    vpc_id = aws_vpc.digichlist_VPC.id
  tags = {
    Name = "Digichlist-LB-Sec-Group"
  }
}
