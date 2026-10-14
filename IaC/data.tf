data "terraform_remote_state" "infra_ecs" {
  backend = "s3"

  config = {
    bucket = "codeparce"
    key    = var.backend_infra
    region = "us-east-1"
  }
}

data "aws_iam_role" "role_exec" {
  name = "ecsTaskExecutionRole"
}