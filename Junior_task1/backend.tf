terraform {
  backend "gcs" {
    bucket = "cloud-test-task"
    prefix = "terraform/cloud-run"
  }
}
