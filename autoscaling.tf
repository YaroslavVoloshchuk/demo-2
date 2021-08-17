resource "aws_autoscaling_group" "digichlist-scaling-fe" {
  launch_configuration = aws_launch_configuration.digichlist_lc_fe.id
  vpc_zone_identifier = [aws_subnet.digichlist_public.id, aws_subnet.digichlist_public_1b.id]
  min_size         = 2
  desired_capacity = 2
  max_size         = 3
  health_check_type = "ELB"
  target_group_arns = [aws_lb_target_group.target_group_fe.arn]
  depends_on = [aws_launch_configuration.digichlist_lc_fe]
  force_delete              = true
  tag {
    key = "Name"
    value = "digichlist-scaling-fe"
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_group" "digichlist-scaling-be" {
  launch_configuration = aws_launch_configuration.digichlist_lc_be.id
  vpc_zone_identifier = [aws_subnet.digichlist_public.id, aws_subnet.digichlist_public_1b.id]
  min_size         = 2
  desired_capacity = 2
  max_size         = 3
  health_check_type = "ELB"
  target_group_arns = [aws_lb_target_group.target_group_be.arn]
  depends_on = [aws_launch_configuration.digichlist_lc_be]
  force_delete              = true
  tag {
    key = "Name"
    value = "digichlist-scaling-be"
    propagate_at_launch = true
  }
}
