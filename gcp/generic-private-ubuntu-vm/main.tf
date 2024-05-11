terraform {
  backend "gcs" {}
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.9.0"
    }
  }
  required_version = ">= 1.3"
}

provider "google" {
  project = var.project
}

locals {
  required_google_apis = [
    "osconfig.googleapis.com",
  ]
}

resource "google_project_service" "enabled-apis" {
  for_each = toset(local.required_google_apis)
  project  = var.project
  service  = each.key
  # Keep the API enabled even if we destroy this
  disable_on_destroy = false
}
