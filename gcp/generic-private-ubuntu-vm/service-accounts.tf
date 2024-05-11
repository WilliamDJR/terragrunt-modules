resource "google_service_account" "private-ubuntu-vm" {
  count = length(var.zones)

  account_id   = "${var.env_tier}-${var.vm_name}-${count.index + 1}"
  display_name = "Service account for VM"
}

# Required for Ops Agent to work
resource "google_project_iam_member" "metric-writer" {
  project = var.project
  count   = length(var.zones)

  role   = "roles/monitoring.metricWriter"
  member = "serviceAccount:${google_service_account.private-ubuntu-vm[count.index].email}"
}

# Required for Ops Agent to work
resource "google_project_iam_member" "log-writer" {
  project = var.project
  count   = length(var.zones)

  role   = "roles/logging.logWriter"
  member = "serviceAccount:${google_service_account.private-ubuntu-vm[count.index].email}"
}
