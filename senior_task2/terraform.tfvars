project_id = "cloud-run-service-task"
region1    = "asia-southeast1"

# Cloud Run Service
cloud_service_name    = "first_cloud_run"
image           = "hello-world"
image_tag       = "latest"
artifact_repository_name = "value"

#VPC
deploy_vpc_name = "value"


#subnet
subnets = {
  subnet1 = {
    name       = "subnet1"
    cidr_block = "10.0.1.0/24"
  },
  subnet2 = {
    name       = "subnet2"
    cidr_block = "10.0.2.0/24"
  }
}