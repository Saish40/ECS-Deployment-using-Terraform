resource "aws_lb_target_group" "TG" {
  name        = "TG"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = aws_vpc.vpc.id
  target_type = "ip"

  tags = {
    Name = "swiggy-tg"
  }

}