# variable for project_id
variable "project_id" {
  description = "Project id should be here"
  type        = string
  validation {
    condition     = length(var.project_id) > 0
    error_message = " We cannot kept Project ID  empty"
  }
}

# variable for region
variable "region" {
  description = "The region in which you have created the vpc"
  type        = string
  default     = "asia-southeast1"
  validation {
    condition     = var.region != null
    error_message = "Region must be specified"
  }
}

# Variable for subnets

variable "subnets" {
  description = "Mapping of subnet configurations."
  type = map(object({
    name       = string
    cidr_block = string
  }))
  validation {
    condition     = can(keys(var.subnets))
    error_message = "Subnets should be provided as a map"
  }
}

# variable for vpc_self_link
variable "vpc_self_link" {
  description = "The self link of the vpc"
  type        = string
}