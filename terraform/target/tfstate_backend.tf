terraform {
  backend "gcs" {
    bucket  = "belz_bucket"
    encrypt = true
  }
}