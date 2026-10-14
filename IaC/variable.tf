
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
  type        = number
}

variable "vpc_id" {
  description = "VPC ID where the infrastructure will be deployed."
  type        = string
}

variable "path_pattern" {
  description = "Path pattern for the listener rule"
  type        = list(string)
}

variable "image_name" {
  description = "Name of the imagen of microservice"
  type        = string
}

variable "backend_infra" {
  description = "Backend remoto of the infrastructure"
  type        = string
}