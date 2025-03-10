module "load_balancer" {
  source = "./module"
#  alb-internal = false
#  subnet = [ "subnet-0ae0f1176f35afeb6", "subnet-006090b15a50d5569" ]
   alb-name = "neew-alb"
#  tg-name = "new-tg"
#  vpc-id = "vpc-0804bbcfc8b2c6f8b"
#  port = 80
#  protocol = "HTTP"
#  alb-security-groups-id = [ "sg-03af1a1831c67a63e" ]
   instance-ids = [ "i-091d1514c8f59bf73", "i-06e7ed0aed38a64f9" ]
   listner-rule-path = "/name/*"
}



#resource "aws_lb_listener" "http_listener" {
#  load_balancer_arn = module.load_balancer.alb_arn
#  port              = 81
#  protocol          = "HTTP"

#  default_action {
#    type             = "forward"
#    target_group_arn = module.load_balancer.target_group_arn
#  }
#}


#resource "aws_lb_listener_rule" "path_based_rule" {
#  listener_arn = aws_lb_listener.http_listener.arn
#  priority     = 100

#  action {
#    type             = "forward"
#    target_group_arn = module.load_balancer.target_group_arn  # Corrected reference
#  }

#  condition {
#    path_pattern {
#      values = ["/app/*"]
#    }
#  }
#}



