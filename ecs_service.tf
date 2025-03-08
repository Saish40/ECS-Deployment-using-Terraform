resource "aws_ecs_service" "swiggy" {
  name                               = "ecs-service"
  cluster                            = aws_ecs_cluster.ECS.id
  launch_type                        = "FARGATE"
  platform_version                   = "LATEST"
  scheduling_strategy                = "REPLICA"
  deployment_minimum_healthy_percent = 100
  deployment_maximum_percent         = 200
  task_definition                    = aws_ecs_task_definition.TD.arn
  desired_count                      = 2
  #iam_role                           = aws_iam_role.iamrole.arn
  depends_on                         = [aws_lb_listener.listner, aws_iam_role.iamrole]

  load_balancer {
    target_group_arn = aws_lb_target_group.TG.arn
    container_name   = "swiggy"
    container_port   = 3000
  }

  network_configuration {
    assign_public_ip = true
    security_groups  = [aws_security_group.SG.id]
    subnets          = [aws_subnet.subnet1.id, aws_subnet.subnet2.id]
  }
}