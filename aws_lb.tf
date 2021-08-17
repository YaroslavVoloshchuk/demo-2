# ## Security Group for ELB
# resource "aws_security_group" "digichlist-elb" {
#   name = "digichlist-elb"
#   egress {
#     from_port = 0
#     to_port = 0
#     protocol = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
#   ingress {
#     from_port = 80
#     to_port = 80
#     protocol = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
#     vpc_id = aws_vpc.digichlist_VPC.id
# }
# # create Load balancer
# resource "aws_elb" "digichlist-elb" {
#     name = "digichlist-elb"
#     security_groups = [aws_security_group.digichlist-elb.id]
#  ## availability_zones       = ["eu-west-2a"]
#     subnets = [aws_subnet.digichlist_public.id]
#
#   listener {
#     lb_port = 80
#     lb_protocol = "tcp"
#     instance_port = "80"
#     instance_protocol = "tcp"
#   }
#   health_check {
#    healthy_threshold = 2
#    unhealthy_threshold = 2
#    timeout = 2
#    interval = 5
#    target = "TCP:80"
#  }
#
#   instances                   = [aws_instance.backend_server_1.id, aws_instance.backend_server_2.id]
#   cross_zone_load_balancing   = true
#   idle_timeout                = 400
#   connection_draining         = true
#   connection_draining_timeout = 400
# }
