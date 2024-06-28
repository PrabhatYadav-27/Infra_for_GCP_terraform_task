
output "name" {
    value = google_cloud_run_service.cloud_run[0].local.image_url
    description = "The URL for Cloud Run Service are displayed"
}

output "image_repo_name" {
    value =  data.google_artifact_registry_repository.image.name

  
}