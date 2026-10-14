variable "execution_role_arn" {
  description = "execution_role_arn"
  type        = string
  default     = "arn:aws:iam::123123124:role/ecsTaskExecutionRole"
}

variable "vpc_id" {
  description = "VPC ID where the infrastructure will be deployed."
  type        = string
  default     = "vpc-12345678"
}


variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}

variable "port" {
  description = "Port for the microservice"
  type        = number
  default     = "8000"
}

variable "repository_name" {
  description = "Name of the microservice"
  type        = string
  default     = "ms-example"
}


variable "image_name" {
  description = "Name of the imagen of microservice"
  type        = string
  default     = "codeparce/blue-gren:blue"
}


variable "target_group_arn" {
  description = "arn of the target group"
  type        = string
  default     = "arn:aws:iam::123123124:role/ecsTaskExecutionRole"
}

variable "cluster_id" {
  description = "arn of the ECS"
  type        = string
  default     = "arn:aws:iam::123123124:role/ecsTaskExecutionRole"
}

variable "sg_ecs_id" {
  description = "id of the Security Groups"
  type        = string
  default     = "sg-020ed364397ab95c6"
}


variable "subnets" {
  description = "Subnets"
  type        = list(string)
}
