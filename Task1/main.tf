# 

resource "google_cloud_run_service" "cloud_run" {
    name     = var.service_name
    location = var.region

    template{
        spec {
          containers {
            image = local.image_url
            ports {
              container_port =  8080
            }
          }
        }
    } 


    # for traffick
    traffic {
      percent = 100
      latest_revision = true
    }
  
}