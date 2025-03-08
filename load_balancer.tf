resource "aws_lb" "ecs-lb" {
  name               = "swiggy-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.SG.id]
  subnets            = [aws_subnet.subnet1.id, aws_subnet.subnet2.id]

  tags = {
    Name = "Swiggy-LB"
  }
}

resource "aws_lb_listener" "listner" {
  load_balancer_arn = aws_lb.ecs-lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.TG.arn
  }

}