variable "project_name" {
  description = "Unique name for this project"
  type        = string
}


variable "role_arn" {
  description = "Codepipeline IAM role arn. "
  type        = string
  default     = ""
}


variable "tags" {
  description = "Tags to be applied to the codebuild project"
  type        = map(any)
}

variable "builder_compute_type" {
  description = "Information about the compute resources the build project will use"
  type        = string
}

variable "builder_image" {
  description = "Docker image to use for the build project"
  type        = string
}

variable "builder_type" {
  description = "Type of build environment to use for related builds"
  type        = string
}

variable "builder_image_pull_credentials_type" {
  description = "Type of credentials AWS CodeBuild uses to pull images in your build."
  type        = string
}

variable "github_url" {
  description = "Information about the build output artifact location"
  type        = string
}

variable "plan" {
  description = "Flag to control whether the plan  should be created"
  type        = bool
}

variable "apply" {
  description = "Flag to control whether the apply  should be created"
  type        = bool
}