
resource "aws_lb_target_group" "tg" {
  name        = "tg-${var.repository_name}-${var.environment}"
  vpc_id      = var.vpc_id
  target_type = "ip"

  protocol = "HTTP"
  port     = var.port

  health_check {
    enabled             = true
    protocol            = "HTTP"
    port                = "traffic-port"
    path                = var.health_check_path
    matcher             = "200"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 3
  }

  tags = {
    tf  = "true"
    env = var.environment
  }
  lifecycle {
    create_before_destroy = true
  }
}
