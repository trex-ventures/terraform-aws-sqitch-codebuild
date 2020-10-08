variable "additional_tags" {
  type        = "map"
  description = "additional tags for the pipeline"
  default     = {}
}

variable "product_domain" {
  type        = "string"
  description = "product domain of the RDS and codebuild owner"
}

variable "description" {
  type        = "string"
  description = "description for the codebuild pipeline tag"
  default     = "codebuild pipeline to deploy sqitch to RDS"
}

variable "codebuild_role_arn" {
  type        = "string"
  description = "The ARN of codebuild role created in codebuild-sqitch-shared-resources."
}

variable "pipeline_name" {
  type        = "string"
  description = "The pipeline name prefix (after product domain), might be RDS name, repository name, or whatever is good enough for your team"
}

variable "environment" {
  type        = "string"
  description = "environment where the resources will be created"
}

variable "vpc_id" {
  type        = "string"
  description = "the VPC ID where the codebuild pipeline will be put. Use vpc_id output from the vpc terraform module"
}

variable "vpc_subnet_app_ids" {
  type        = "list"
  description = "the app subnets for the codebuild pipeline. Use subnet_app_ids output from the vpc terraform module"
}

variable "codebuild_sqitch_sg_id" {
  type        = "string"
  description = "The security group for the codebuild pipeline, use the codebuild_security_group_id from the codebuild-sqitch-shared-resources"
}

variable "sqitch_project_path" {
  type        = "string"
  description = "the sqitch project path from repository root"
}

variable "sqitch_project_repository" {
  type        = "string"
  description = "the repository that contains the sqitch project"
}

variable "password_parameter_store_path" {
  type        = "string"
  description = "the name of the postgres password parameter (looks like a path) in the ssm parameter store"
}

variable "log_retention_in_days" {
  type        = "string"
  description = "the length of the period where each log will be saved"
  default     = "14"
}
