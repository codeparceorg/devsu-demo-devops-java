resource "aws_ecs_task_definition" "td" {
  family                   = var.repository_name
  execution_role_arn       = var.execution_role_arn
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = 1024 # por defecto
  memory                   = 2048

  container_definitions = jsonencode([
    {
      name      = var.repository_name
      image     = var.image_name
      cpu       = 256 
      memory    = 512
      
      essential = true
      portMappings = [
        {
          containerPort = var.port
          protocol      = "tcp"
          hostPort      = var.port
        }
      ]
    },

  ])

  tags_all = {
    tf  = "true"
    env = var.environment
  }


}

