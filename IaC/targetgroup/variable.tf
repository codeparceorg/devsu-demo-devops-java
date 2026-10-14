
variable "repository_name" {
  description = "Name of the microservice"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
}

variable "health_check_path" {
  description = "Path for the health check"
  type        = string
}

variable "port" {
  description = "Port for the microservice"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where the infrastructure will be deployed."
  type        = string
}

variable "path_pattern" {
  description = "Path pattern for the listener rule"
  type        = list(string)
}

variable "listener_arn" {
  description = "ARN Listener LoadBalancer"
  type        = string
}
