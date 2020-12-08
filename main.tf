# Codebuild Pipeline Name
module "codebuild_name" {
  source        = "github.com/traveloka/terraform-aws-resource-naming.git?ref=v0.18.1"
  name_prefix   = "${var.product_domain}-${var.pipeline_name}"
  resource_type = "codebuild_project" 
} 

# Codebuild pipeline
resource "aws_codebuild_project" "deploy_pipeline" {
  name         = "${module.codebuild_name.name}"
  description  = "${var.description}"
  service_role = "${var.codebuild_role_arn}"
  
  vpc_config {
    vpc_id = "${var.vpc_id}"
    
    subnets = [ "${var.vpc_subnet_app_ids}" ]
    
    security_group_ids = [ "${var.codebuild_sqitch_sg_id}" ]
  }

  artifacts {
    type = "NO_ARTIFACTS"
  }

  environment {
    compute_type    = "BUILD_GENERAL1_SMALL"
    image           = "aws/codebuild/standard:4.0"
    type            = "LINUX_CONTAINER"
    privileged_mode = true
    
    environment_variable = [
      {
        name  = "PGPASSWORD"
        value = "${var.password_parameter_store_path}"
        type  = "PARAMETER_STORE"
      },
      {
        name  = "TRAVELOKA_ENV"
        value = "${var.environment}"
        type  = "PLAINTEXT"
      },
      {
        name  = "SQITCH_OPS"
        value = "deploy"
        type  = "PLAINTEXT"
      },
      {
        name  = "SQITCH_OPS_TARGET"
        value = "HEAD"
        type  = "PLAINTEXT"
      },

      {
        name  = "SQITCH_PROJECT_PATH"
        value = "${var.sqitch_project_path}"
        type  = "PLAINTEXT"
      },
      "${var.environment_variables}",
    ]
  }

  source {
    type            = "GITHUB"
    location        = "${var.sqitch_project_repository}"
    buildspec       = "${coalesce(var.buildspec, data.template_file.buildspec.rendered)}"
    git_clone_depth = "1"
  }

  source_version = "${var.source_version}"

  tags = "${merge(var.additional_tags, map(
    "Name", format("%s-%s", var.product_domain, var.pipeline_name),
    "ProductDomain", var.product_domain,
    "Repository", var.sqitch_project_repository,
    "Description", var.description,
    "Environment", var.environment,
    "ManagedBy", "terraform",
  ))}"
}

# Cloudwatch Log Group
resource "aws_cloudwatch_log_group" "build" {
  name = "/aws/codebuild/${aws_codebuild_project.deploy_pipeline.name}"

  retention_in_days = "${var.log_retention_in_days}"

  tags = "${merge(var.additional_tags, map(
    "Name", format("/aws/codebuild/%s", aws_codebuild_project.deploy_pipeline.name),
    "ProductDomain", var.product_domain,
    "Repository", var.sqitch_project_repository,
    "Environment", var.environment,
    "Description", format("LogGroup for %s sqitch deploy pipeline", var.pipeline_name),
    "ManagedBy", "terraform",
  ))}"
}
