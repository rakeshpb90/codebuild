project_name                        = "my-terraform-project"
role_arn                            = "arn:aws:iam::059234262850:role/service-role/codebuild-plann-service-role-new"
tags = {
  Project_Name = "my-terraform-project"
  Environment  = "dev"
  Account_ID   = "123456789012"
  Region       = "us-east-1"
}
builder_compute_type                = "BUILD_GENERAL1_SMALL"
builder_image                       = "aws/codebuild/amazonlinux2-x86_64-standard:3.0"
builder_type                        = "LINUX_CONTAINER"
builder_image_pull_credentials_type = "CODEBUILD"
github_url                           = "https://github.com/rakeshpb90/terraform-demo.git"
plan                                 = true
apply                                = false   

