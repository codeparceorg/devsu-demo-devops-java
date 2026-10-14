
resource "aws_lb_listener_rule" "rule" {
  listener_arn = var.listener_arn
  
  depends_on = [ aws_lb_target_group.tg ]

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg.arn
  }

  condition {
    path_pattern {
      values = var.path_pattern
    }
  }

  tags = {
    tf  = "true"
    env = var.environment
  }
  
}