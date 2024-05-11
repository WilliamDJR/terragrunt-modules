terraform {
  backend "gcs" {}
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.21.0"
    }
  }
  required_version = ">= 1.3"
}

provider "google" {
  project = var.project
}

locals {
  labels = {
    env                  = var.env_name
    managed_by_terraform = "1"
    product              = var.product_name
    environment          = var.env_name
    component            = "pubsub"
  }
  required_google_apis = [
    "serviceusage.googleapis.com",
    "pubsub.googleapis.com",
    "iam.googleapis.com",
  ]
}

resource "google_project_service" "enabled-apis" {
  for_each = toset(local.required_google_apis)
  project  = var.project
  service  = each.key
  # Keep the API enabled even if we destroy this
  disable_on_destroy = false
}
