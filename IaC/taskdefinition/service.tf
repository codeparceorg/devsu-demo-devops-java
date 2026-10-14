resource "aws_ecs_service" "app" {
  depends_on      = [aws_ecs_task_definition.td]
  name            = var.repository_name
  cluster         = var.cluster_id
  task_definition = aws_ecs_task_definition.td.arn
  desired_count   = 2


  capacity_provider_strategy {
    capacity_provider = "FARGATE"
    base = 20
    weight = 50
  }

  network_configuration {
    subnets         = var.subnets
    security_groups = [var.sg_ecs_id]
    assign_public_ip = true
  }

  load_balancer {
    target_group_arn = var.target_group_arn
    container_name   = var.repository_name
    container_port   = var.port
  }

  tags_all = {
    tf  = "true"
    env = var.environment
  }

}
