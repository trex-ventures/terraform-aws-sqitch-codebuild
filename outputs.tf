output "codebuild_arn" {
  value       = aws_codebuild_project.deploy_pipeline.arn
  description = "The pipeline's ARN"
}

output "codebuild_id" {
  value       = aws_codebuild_project.deploy_pipeline.id
  description = "The pipeline's ID"
}
