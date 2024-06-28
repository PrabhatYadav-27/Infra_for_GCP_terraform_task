# Module for Cloud Run Service
module "cloud-run" {
  source          = "./modules/cloud-run"
  project_id      = var.project_id
  region          = var.region
  service_name    = var.service_name
  image           = var.image
  image_tag       = var.image_tag
  repository_name = var.repository_name
}
# Module for VPC
module "vpc" {
  source     = "./modules/vpc"
  vpc_name   = var.vpc_name
  project_id = var.project_id
}

# Module for Subnet
module "subnet" {
  source        = "./modules/subnets"
  vpc_self_link = module.vpc.vpc_self_link
  region        = var.region
  subnets       = var.subnets
  project_id    = var.project_id
}