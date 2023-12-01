terraform {
  backend "gcs" {
    bucket  = "belzgkebucket"
    encrypt = true
  }
}