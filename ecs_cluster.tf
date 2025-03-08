resource "aws_ecs_cluster" "ECS" {
  name = "mycluster"
  tags = {
    Name = "swiggy-cluster"
  }
}