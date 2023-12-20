resource "aws_lb" "my-alb" {
  name               = "my-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.sg.id]
  subnets            = [aws_subnet.sub1.id, aws_subnet.sub2.id]
  tags = {
    Environment = "production"
  }
}


resource "aws_lb_listener" "listner" {
  load_balancer_arn = aws_lb.my-alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg-home.arn
  }
}
# resource "aws_lb_listener_rule" "rule-1" {
#   listener_arn = aws_lb_listener.listner.arn
#   priority     = 100

#   action {
#     type             = "forward"
#     target_group_arn = aws_lb_target_group.tg-home.arn
#   }
#   condition {
#     path_pattern {
#       values = ["/"]
#     }
#   }
# }
resource "aws_lb_listener_rule" "rule-1" {
  listener_arn = aws_lb_listener.listner.arn
  priority     = 101

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg-mobile.arn
  }
  condition {
    path_pattern {
      values = ["/mobile/*"]
    }
  }
}
resource "aws_lb_listener_rule" "rule-2" {
  listener_arn = aws_lb_listener.listner.arn
  priority     = 102

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg-laptop.arn
  }

  condition {
    path_pattern {
      values = ["/laptop/*"]
    }
  }
}