
variable "repository_name" {
  description = "Name of the microservice"
  type        = string
  default     = "ms-example"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}

variable "health_check_path" {
  description = "Path for the health check"
  type        = string
  default     = "/actuator/health"
}

variable "port" {
  description = "Port for the microservice"
  type        = number
  default     = "8000"
}

variable "vpc_id" {
  description = "VPC ID where the infrastructure will be deployed."
  type        = string
  default     = "vpc-12345678"
}

variable "path_pattern" {
  description = "Path pattern for the listener rule"
  type        = list(string)
  default     = ["/api/*", "/actuator/*"]  
}

variable "image_name" {
  description = "Name of the imagen of microservice"
  type        = string
  default     = "codeparce/blue-gren:blue"
}

variable "backend_infra" {
  description = "Backend remoto of the infrastructure"
  type        = string
  default     = "codeparce/blue-gren/state"
}