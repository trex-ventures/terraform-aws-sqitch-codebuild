data "terraform_remote_state" "vpc_lab_production" {
  backend = "s3"

  config = {
    bucket         = "default-terraform-state-ap-southeast-1-146534595588"
    dynamodb_table = "default-terraform-state-ap-southeast-1-146534595588"
    key            = "ap-southeast-1/general/vpc/lab-production/terraform.tfstate"
    region         = "ap-southeast-1"
  }
}

data "terraform_remote_state" "codebuild_sqitch_shared_resources" {
  backend = "s3"

  config = {
    bucket         = "default-terraform-state-ap-southeast-1-146534595588"
    dynamodb_table = "default-terraform-state-ap-southeast-1-146534595588"
    key            = "ap-southeast-1/codebuild-sqitch-shared-resources/bei/terraform.tfstate"
    region         = "ap-southeast-1"
  }
}
