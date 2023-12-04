resource "aws_codebuild_project" "terraform_codebuild_project" {
  name           = var.project_name
  service_role   = var.role_arn

  logs_config {
    cloudwatch_logs {
      status = "ENABLED"
    }
  }


  artifacts {
    type = "NO_ARTIFACTS"
  }

  environment {
    compute_type                = var.builder_compute_type
    image                       = var.builder_image
    type                        = var.builder_type
    privileged_mode             = true
    image_pull_credentials_type = var.builder_image_pull_credentials_type
  }

  source {
    type            = "GITHUB"
    location        = var.github_url
    git_clone_depth = 1

    git_submodules_config {
      fetch_submodules = true
    }

    buildspec = var.plan ? "./templates/terraform_plan.yml" : "./templates/terraform_apply.yml"
  }

}


resource "aws_codebuild_webhook" "plan" {
  count = var.plan ? 1 : 0
  project_name = aws_codebuild_project.terraform_codebuild_project.name
  build_type   = "BUILD"
  filter_group {
    filter {
      type    = "EVENT"
      pattern = "PULL_REQUEST_CREATED,PULL_REQUEST_UPDATED,PULL_REQUEST_REOPENED"
    }
    
  }
}

resource "aws_codebuild_webhook" "apply" {
  count = var.apply ? 1 : 0
  project_name = aws_codebuild_project.terraform_codebuild_project.name
  build_type   = "BUILD"
  filter_group {
    filter {
      type    = "EVENT"
      pattern = "PUSH"
    }
    filter {
      type    = "BASE_REF"
      pattern = "master"
    }
  }
}
