resource "aws_autoscaling_group" "devops_asg" {
  name                = "devops-project-asg"
  desired_capacity    = var.desired_capacity
  min_size            = var.min_size
  max_size            = var.max_size
  vpc_zone_identifier = data.aws_subnets.default.ids
  target_group_arns   = [aws_lb_target_group.app_tg.arn]
  health_check_type   = "ELB"

  launch_template {
    id      = aws_launch_template.devops_lt.id
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    value               = "devops-project-asg-instance"
    propagate_at_launch = true
  }
}
