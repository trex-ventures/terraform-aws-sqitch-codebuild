# Codebuild Pipeline Name
resource "random_id" "codebuild_name" {
  prefix = format("%s-%s-sqitch-", var.product, var.service_name)
  keepers = {
    product = var.product
  }

  byte_length = 8
}

# Codebuild pipeline
resource "aws_codebuild_project" "deploy_pipeline" {
  name         = random_id.codebuild_name.hex
  description  = var.description
  service_role = var.codebuild_role_arn

  vpc_config {
    vpc_id             = var.vpc_id
    subnets            = var.vpc_subnet_app_ids
    security_group_ids = ["${var.codebuild_sqitch_sg_id}"]
  }

  artifacts {
    type = "NO_ARTIFACTS"
  }

  environment {
    compute_type                = "BUILD_GENERAL1_SMALL"
    image                       = var.codebuild_image
    type                        = "LINUX_CONTAINER"
    privileged_mode             = var.codebuild_privileged_mode
    image_pull_credentials_type = var.image_pull_credentials_type

    environment_variable {
      name  = "PGPASSWORD"
      value = var.password_parameter_store_path
      type  = "PARAMETER_STORE"
    }

    environment_variable {
      name  = "TRAVELOKA_ENV"
      value = var.environment
      type  = "PLAINTEXT"
    }

    environment_variable {
      name  = "SQITCH_OPS"
      value = "deploy"
      type  = "PLAINTEXT"
    }

    environment_variable {
      name  = "SQITCH_OPS_TARGET"
      value = "HEAD"
      type  = "PLAINTEXT"
    }

    environment_variable {
      name  = "SQITCH_PROJECT_PATH"
      value = var.sqitch_project_path
      type  = "PLAINTEXT"
    }

    dynamic "environment_variable" {
      for_each = var.environment_variables
      content {
        name  = environment_variable.value["name"]
        value = environment_variable.value["value"]
        type  = environment_variable.value["type"]
      }
    }
  }

  source {
    type            = "GITHUB"
    location        = var.sqitch_project_repository
    buildspec       = coalesce(var.buildspec, data.template_file.buildspec.rendered)
    git_clone_depth = "1"
  }

  source_version = var.source_version
}

# Cloudwatch Log Group
resource "aws_cloudwatch_log_group" "build" {
  name = "/aws/codebuild/${aws_codebuild_project.deploy_pipeline.name}"

  retention_in_days = var.log_retention_in_days

  tags = {
    Description : format("LogGroup for %s sqitch deploy pipeline", var.service_name)
  }
}
