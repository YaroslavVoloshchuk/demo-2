resource "aws_lb_target_group" "target_group_fe" {
  name     = "target-group-fe"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.digichlist_VPC.id

  lifecycle {
    create_before_destroy = true
  }

   health_check {
     path = "/"
     port                = 80
     protocol            = "HTTP"
     healthy_threshold   = 2
     unhealthy_threshold = 2
     timeout             = 3
     interval            = 10
     matcher             = "200"
   }

}

resource "aws_lb_target_group" "target_group_be" {
  name     = "target-group-be"
  port     = 5000
  protocol = "HTTP"
  vpc_id   = aws_vpc.digichlist_VPC.id

  lifecycle { create_before_destroy = true }

   health_check {
     path = "/api-docs/"
     port                = 5000
     protocol            = "HTTP"
     healthy_threshold   = 2
     unhealthy_threshold = 2
     timeout             = 3
     interval            = 10
     matcher             = "200"
   }


}
