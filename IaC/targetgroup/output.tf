# outputs.tf
output "target_group_arn" {
  description = "ARN del Target Group del microservicio users"
  value       = aws_lb_target_group.tg.arn
}

output "lb_listener_rule" {
  description = "ARN del Rule del Listener del microservicio users"
  value       = aws_lb_listener_rule.rule.arn
}
