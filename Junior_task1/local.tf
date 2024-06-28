# You can use/Define the dockerImage URL link here 

locals {
  image_url = "gcr.io/${var.project_id}/${var.image_name}:${var.image_tag}"
}
