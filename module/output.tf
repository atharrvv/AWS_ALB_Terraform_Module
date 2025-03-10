
output "alb_arn" {
  value = aws_lb.load.arn
}

output "target_group_arn" {
  value = aws_lb_target_group.target.arn
}

