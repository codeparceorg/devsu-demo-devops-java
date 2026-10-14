module "my_target_group" {
  source = "./targetgroup"

  repository_name = var.repository_name
  environment = var.environment
  port        = var.port
  health_check_path = var.health_check_path
  path_pattern = var.path_pattern

  vpc_id      = data.terraform_remote_state.infra_ecs.outputs.vpc.vpc_id
  listener_arn = data.terraform_remote_state.infra_ecs.outputs.alb.listeners_arn
}


module "my_task_definition" {
  source = "./taskdefinition"
  cluster_id = data.terraform_remote_state.infra_ecs.outputs.ecs.cluster_id
  execution_role_arn= data.aws_iam_role.role_exec.arn
  vpc_id      = data.terraform_remote_state.infra_ecs.outputs.vpc.vpc_id
  environment = var.environment
  port        = var.port
  repository_name = var.repository_name
  image_name = var.image_name
  target_group_arn = module.my_target_group.target_group_arn
  sg_ecs_id = data.terraform_remote_state.infra_ecs.outputs.vpc.sg_ecs_id
  subnets = data.terraform_remote_state.infra_ecs.outputs.vpc.subred_public_all
}

