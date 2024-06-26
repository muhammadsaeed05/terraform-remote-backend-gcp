
terraform {
  backend "gcs" {
    bucket      = "your-bucket-name"
    prefix      = "terraform/state"
    credentials = file("path/to/service-account.json")
  }

}

provider "google" {
  project     = var.project_id
  credentials = file(var.credentials_path)
  region      = "us-central1"
}

resource "google_storage_bucket" "terraform_state_bucket" {
  name          = var.bucket_name
  location      = "us-central1"
  storage_class = "STANDARD"
  versioning {
    enabled = true
  }
  uniform_bucket_level_access = true
  force_destroy               = true
}
