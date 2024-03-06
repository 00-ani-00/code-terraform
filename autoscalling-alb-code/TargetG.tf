resource "aws_lb_target_group" "tg-home" {
  name     = "Home-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.vpc.id

  health_check {
    path      = "/"
}
}

resource "aws_lb_target_group" "tg-mobile" {
  name     = "Mobile-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.vpc.id

  health_check {
    path      = "/mobile/"
}
}

resource "aws_lb_target_group" "tg-laptop" {
  name     = "Laptop-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.vpc.id

  health_check {
    path      = "/laptop/"
  }
}