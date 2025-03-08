output "lb_dns_name" {
  value = aws_lb.ecs-lb.dns_name

}
output "aws_security_group" {
    value = aws_security_group.SG.id
  
}