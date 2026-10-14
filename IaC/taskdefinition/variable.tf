variable "execution_role_arn" {
  description = "execution_role_arn"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where the infrastructure will be deployed."
  type        = string
}


variable "environment" {
  description = "Environment name"
  type        = string
}

variable "port" {
  description = "Port for the microservice"
  type        = number
}

variable "repository_name" {
  description = "Name of the microservice"
  type        = string
}


variable "image_name" {
  description = "Name of the imagen of microservice"
  type        = string
}


variable "target_group_arn" {
  description = "arn of the target group"
  type        = string
}

variable "cluster_id" {
  description = "arn of the ECS"
  type        = string
}

variable "sg_ecs_id" {
  description = "id of the Security Groups"
  type        = string
}


variable "subnets" {
  description = "Subnets"
  type        = list(string)
}
