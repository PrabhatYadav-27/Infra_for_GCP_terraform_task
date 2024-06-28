project_id = "Give_YOUR_PROJECT_ID"
region     = "asia-southeast1"

# Cloud Run Service
service_name    = "first_cloud_run"
image           = "hello-world"
image_tag       = "latest"
repository_name = "cloud_run_source_deploy"

#VPC
vpc_name = "my-vpc"


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