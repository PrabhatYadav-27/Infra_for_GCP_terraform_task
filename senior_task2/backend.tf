terraform {
  backend "gcs" {
    bucket = "BUCKET_NAME"
    prefix = "terraform/cloud-run"
  }
}
