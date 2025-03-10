####################################################
# create application load balancer
####################################################
resource "aws_lb" "load" {
  name               = var.alb-name
  internal           = var.alb-internal
  load_balancer_type = "application"
  security_groups    = var.alb-security-groups-id
  subnets            = [var.subnet[0], var.subnet[1]]
  # subnets          = [aws_subnet.public_subnet1.id, aws_subnet.public_subnet2.id]
  
  enable_deletion_protection = false

  tags = {
    Environment = "production"
  }
}


####################################################
# create target group for ALB
####################################################
resource "aws_lb_target_group" "target" {
  name     = var.tg-name
  target_type = "instance"
  port     = var.port
  protocol = var.protocol
  vpc_id   = var.vpc-id


  tags = {
    Name = var.tg-name
  }
}


####################################################
# create a listener on port 80 with redirect action
####################################################
resource "aws_lb_listener" "alb-listener" {
  load_balancer_arn = aws_lb.load.arn
  port              = var.port
  protocol          = var.protocol

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target.arn
  }
}


####################################################
# Target Group Attachment with Instance
####################################################
resource "aws_lb_target_group_attachment" "tg-attach" {
  count            = length(var.instance-ids)
  target_group_arn = aws_lb_target_group.target.arn
#  target_id        = var.instance-ids[0]
#  target_id = [var.instance-ids[0], var.instance-ids[1]]
  target_id        = var.instance-ids[count.index]
  port             = var.port
}


resource "aws_lb_listener_rule" "alb-listener-rule" {
  listener_arn = aws_lb_listener.alb-listener.arn
  priority     = var.listner-priority

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target.arn
  }

  condition {
    path_pattern {
      values = [var.listner-rule-path]
    }
  }

 # condition {
  #   host_header {
  #     values = [""]
  #   }
  # }
}




