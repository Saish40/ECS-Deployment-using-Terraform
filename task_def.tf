resource "aws_ecs_task_definition" "TD" {
  family                   = "swiggy"
  requires_compatibilities = ["FARGATE"]
  execution_role_arn       = aws_iam_role.iamrole.arn
  network_mode             = "awsvpc"
  cpu                      = 1024
  memory                   = 2048
  container_definitions = jsonencode([{
    name      = "swiggy"
    image     = "saish69/swiggy_clone"
    cpu       = 1024
    memory    = 2048
    essential = true
    portMappings = [
      {
        containerPort = 3000
        hostPort      = 3000
      }
    ]
  }])

}

data "aws_ecs_task_definition" "TD" {
  task_definition = aws_ecs_task_definition.TD.family

}
