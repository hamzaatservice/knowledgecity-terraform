resource "aws_launch_configuration" "default" {
  name          = "knowledgecity-launch-configuration"
  image_id     = var.ami_id
  instance_type = var.instance_type

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "default" {
  launch_configuration = aws_launch_configuration.default.id
  min_size            = var.min_size
  max_size            = var.max_size
  desired_capacity    = var.desired_capacity
  vpc_zone_identifier = [aws_subnet.private.id]

  tag {
    key                 = "Name"
    value               = "KnowledgeCityASG"
    propagate_at_launch = true
  }
}
