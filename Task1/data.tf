# This part is used to fetch the information about Artifact Registry repository

data "google_artifact_registry_repository" "image" {
    project    = var.project_id
    repository_id = var.repository_name
    location = var.region 
  
}