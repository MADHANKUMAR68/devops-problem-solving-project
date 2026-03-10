output "alb_dns_name" {
  value = aws_lb.app_alb.dns_name
}

output "target_group_arn" {
  value = aws_lb_target_group.app_tg.arn
}

output "autoscaling_group_name" {
  value = aws_autoscaling_group.devops_asg.name
}
