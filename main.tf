terraform {
  required_version = ">= 1.0.0"

  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = ">= 4.20.1"
    }
  }

}

terraform {
  backend "s3" {
    bucket         = "terraformstaterakesh"
    key            = "codebuild_new/terraform.tfstate"
    region         = "us-east-1"  # Set the region of your S3 bucket
    encrypt        = true
    dynamodb_table = "tf-state-lock-dynamo"  # Optional: Enable DynamoDB table for state locking
  }
}


# Module for Infrastructure Validation - CodeBuild
module "codebuild_terraform" {
  source = "./modules/codebuild"

  project_name                        = var.project_name
  role_arn                            = var.role_arn
  github_url                           = var.github_url
  builder_compute_type                = var.builder_compute_type
  builder_image                       = var.builder_image
  builder_image_pull_credentials_type = var.builder_image_pull_credentials_type
  builder_type                        = var.builder_type
  tags                                = var.tags
  plan                                = var.plan
  apply                               = var.apply
}
