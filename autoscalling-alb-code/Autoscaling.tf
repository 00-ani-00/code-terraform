resource "aws_autoscaling_group" "asg-1" {
  name              = "project1-asg"
  max_size          = 3
  min_size          = 1
  desired_capacity  = 1
  target_group_arns = [aws_lb_target_group.tg-home.arn]

  launch_template {
    id      = aws_launch_template.LT-1.id
    version = "$Latest"
  }
  vpc_zone_identifier = [aws_subnet.sub1.id, aws_subnet.sub2.id]


}

resource "aws_autoscaling_group" "asg-2" {
  name              = "project2-asg"
  max_size          = 3
  min_size          = 1
  desired_capacity  = 1
  target_group_arns = [aws_lb_target_group.tg-mobile.arn]

  launch_template {
    id      = aws_launch_template.LT-2.id
    version = "$Latest"
  }
  vpc_zone_identifier = [aws_subnet.sub1.id, aws_subnet.sub2.id]


}

resource "aws_autoscaling_group" "asg-3" {
  name              = "project3-asg"
  max_size          = 3
  min_size          = 1
  desired_capacity  = 1
  target_group_arns = [aws_lb_target_group.tg-laptop.arn]

  launch_template {
    id      = aws_launch_template.LT-3.id
    version = "$Latest"
  }
  vpc_zone_identifier = [aws_subnet.sub1.id, aws_subnet.sub2.id]


}