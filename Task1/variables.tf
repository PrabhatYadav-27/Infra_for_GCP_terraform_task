# Variables are used to make configuration more flexible, reusable and maintainable

# Terms are to be used here
# description = To describe the variable which are to be define
# type = This is used to describe the variable type


# Variable for "project_id"

variable "project_id" {
    description = "This is project_id of the project where we are going to create the Cloud Run Service"
    type = string
  
}

# variable for region

variable "region" {
    description = "Select the region where you want to  create the Cloud Run Service"
    type =  string
    default = "asia-southeast1"
  
}

# Define variable for the service_name
variable "service_name" {
    description = "The service name required here like Cloud Run Service"
    type = string
  
}

# variable for image_tag 
variable "image_tag" {
    description = "Provide the image tag which is to be use"
    type = string
  
}

# variable for the repository_name
variable "repository_name" {
    description = "Write the repository name using for project"
    type = string

}

# Variable for container image_name
variable "image_name" {
    description = "Provide the container image name"
    type = string
  
}

#variable for container image_tag
variable "image_tag" {
    description = "Give conatainer image tag"
    type = string
} 

