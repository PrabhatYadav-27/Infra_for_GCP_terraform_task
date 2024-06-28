resource "google_cloud_run_service" "cloud_run" {
    name     = var.cloud_run_servie_name
    location = var.region2

    template {
        spec {
          containers {
            image = local.image_url
            ports {
              container_port = 8080
            }
          }
        }
    }

    traffic {
      percent         = 100
      latest_revision = true
    }
}
