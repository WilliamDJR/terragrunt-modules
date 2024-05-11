resource "google_compute_instance" "generic-private-ubuntu" {
  name                      = "${var.env_tier}-${var.vm_name}-${count.index + 1}"
  count                     = length(var.zones)
  machine_type              = var.machine_type
  can_ip_forward            = false
  zone                      = element(var.zones, count.index)
  deletion_protection       = var.deletion_protection
  allow_stopping_for_update = var.allow_stopping_for_update

  shielded_instance_config {
    enable_secure_boot          = true
    enable_vtpm                 = true
    enable_integrity_monitoring = true
  }

  boot_disk {
    auto_delete = var.auto_delete_boot_disk
    initialize_params {
      image = var.disk_source
      size  = var.disk_size
      type  = var.disk_type
    }
  }

  network_interface {
    subnetwork = var.subnetworks[var.region]
  }

  metadata = {
    block-project-ssh-keys = "true"
    startup-script         = var.start_up_script
    enable-osconfig        = "TRUE"
    enable-oslogin         = "TRUE"
  }

  labels = {
    os                   = "ubuntu"
    managed_by_terraform = "1"
    art                  = var.art
    usage                = var.usage_label
    env                  = var.env_name
    component            = var.component_name
    product              = var.product_name
  }

  service_account {
    email  = google_service_account.private-ubuntu-vm[count.index].email
    scopes = ["cloud-platform"]
  }

  tags = var.vm_tags

  # lifecycle {
  #   # Ignore any changes to do with metadata
  #   ignore_changes = [metadata]
  # }
}
