# VARIABLE FOR PROJECT_ID
variable "project_id" {
  description = "The project_id should be here"
  type        = string
  validation {
    condition     = length(var.project_id) > 0
    error_message = "Project ID cannot be empty it must have some name"
  }
}

# variable for image_tag
variable "image_tag" {
  description = "This is container image_tag"
  type        = string
  validation {
    condition     = var.image_tag != null
    error_message = "The image tag must be defined or specified"

  }
}

# variable for repository_name
variable "repository_name" {
  description = "Name of the repository"
  type        = string
  validation {
    condition     = var.repository_name != null
    error_message = "Repository name must be specified"
  }
}

# variable for region
variable "region" {
  description = "This has to be specified in which region we will be creating the Cloud Run Service"
  type        = string
  default     = "asia-southeast1"
  validation {
    condition     = var.region != null
    error_message = "Please specify the region"
  }
}

# variable for service_name
variable "service_name" {
  description = "The name for Cloud Run service"
  type        = string
  validation {
    condition     = length(var.service_name) > 0
    error_message = "Service name cannot be empty"
  }
}

# variable for image
variable "image" {
  description = "The container of image which is to be deployed"
  type        = string
  validation {
    condition     = var.image != null
    error_message = "Image cannot be null"
  }
}