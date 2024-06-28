# variable for project_id
variable "project_id" {
  description = "The preject_id  "
  type        = string
  validation {
    condition     = length(var.project_id) > 0
    error_message = "Project ID cannot be empty"
  }
}

# variable for region

variable "region" {
  description = "The region in which to you wanted to create vpc"
  type        = string
  default     = "asia-southeast1"
  validation {
    condition     = var.region != null
    error_message = "Region must be specified"
  }
}

# variable for vpc_name

variable "vpc_name" {
  description = "Name for the vpc"
  type        = string
  validation {
    condition     = length(var.vpc_name) > 0
    error_message = "VPC name cannot be empty"
  }
}