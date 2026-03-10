resource "aws_launch_template" "devops_lt" {
  name_prefix   = "devops-project-lt-"
  image_id      = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  key_name      = var.key_name

  vpc_security_group_ids = [aws_security_group.ec2_sg.id]

  user_data = base64encode(file("${path.module}/monitoring-userdata.sh"))

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "devops-project-asg-instance"
    }
  }
}
