module "codebuild_sqitch" {
  source = "../../"

  product      = local.product_domain
  description  = "CodeBuild project for deploying sqitch project to dummy-rds-postgres"
  service_name = "dummy-rds-postgres"
  environment  = "production"

  vpc_id                 = data.terraform_remote_state.vpc_lab_production.outputs.vpc_id
  vpc_subnet_app_ids     = data.terraform_remote_state.vpc_lab_production.outputs.subnet_app_ids
  codebuild_sqitch_sg_id = data.terraform_remote_state.codebuild_sqitch_shared_resources.outputs.codebuild_security_group_id
  codebuild_role_arn     = data.terraform_remote_state.codebuild_sqitch_shared_resources.outputs.codebuild_role_arn

  sqitch_project_repository     = "https://github.com/traveloka/bei-postgres-template.git"
  password_parameter_store_path = "/tvlk-secret/codebuild/bei/example-pg-password"
  sqitch_project_path           = "example-logical-db/example-sqitch-project"

  environment_variables = [
    {
      name  = "CI_NAME"
      value = "codebuild"
      type  = "PLAINTEXT"
    }
  ]

  buildspec = data.template_file.buildspec.rendered
}
