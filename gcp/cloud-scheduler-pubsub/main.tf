terraform {
  backend "gcs" {}
  required_providers {
    google = {
      version = "~> 5.10"
      source  = "hashicorp/google"
    }
  }
  required_version = ">= 1.5"
}

provider "google" {
  project = var.project
  region  = "asia-east1"
}

locals {
  labels = {
    env                  = var.env_name
    managed_by_terraform = "1"
  }
}
