# This is use to define the permmission use for members

resource "google_cloud_run_service_iam_member" "invoker" {
    service  =  google_cloud_run_service.cloud_run.name
    location = google_cloud_run_service.cloud_run.location
    # adding the roles of run invoker
    role     = "roles/run.invoker"
    # all the users can access
    member   = "allUsers"
  
}