#Display the url for cloud run
output "cloud_run_url" {
  value       = module.cloud_run.cloud_run_url # will display the url of the cloud run
  description = "The URL for the Cloud Run Service"
}


