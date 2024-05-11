variable "project" {
  type        = string
  description = "Name of the GCP project"
}

variable "region" {
  type        = string
  description = "Region to deploy GCE VM to"
}

variable "subnetworks" {
  type = map(string)
}

variable "art" {
  type        = string
  description = "Which agile release train is this resource associated with"
}

variable "env_tier" {
  type        = string
  description = "VM name is prefixed with this"
}

variable "vm_name" {
  type = string
}

# variable "instance_count" {
#   type        = number
#   description = ""
# }

variable "machine_type" {
  type    = string
  default = "e2-standard-2"
}

variable "zones" {
  type        = list(string)
  description = "Zones to deploy VMs to, dictates the number of VMs that will be deployed as well"
}

variable "vm_tags" {
  type = list(string)
}

variable "disk_source" {
  type        = string
  description = "Image to build the VM with. See output from gcloud compute images list"
  default     = "ubuntu-os-cloud/ubuntu-2204-lts"
}

variable "disk_size" {
  type        = string
  default     = "100"
}

variable "disk_type" {
  type    = string
  default = "pd-balanced"
}

variable "start_up_script" {
  type    = string
  default = <<EOF
#! /bin/bash
echo 'deb http://packages.cloud.google.com/apt google-compute-engine-focal-stable main' > /etc/apt/sources.list.d/google-compute-engine.list
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
apt update
apt -y install google-osconfig-agent
curl -sSO https://dl.google.com/cloudagents/add-google-cloud-ops-agent-repo.sh
sudo bash add-google-cloud-ops-agent-repo.sh --also-install
EOF
}

variable "auto_delete_boot_disk" {
  type    = bool
  default = true
}

variable "deletion_protection" {
  type        = bool
  description = "Whether nodes will have deletion_protection enabled"
  default     = true
}

variable "allow_stopping_for_update" {
  type        = bool
  description = "Whether nodes will let you stop them to update them (i.e. when changing machine_type)"
  default     = false
}

variable "usage_label" {
  type        = string
  description = "Label to mark what the purpose of the VM is"
}

variable "env_name" {
  type        = string
  description = "Name of the environment, instances will be prefixed with this name (for costing)"
}

variable "product_name" {
  type        = string
  description = "Name of the product this VM instance is used by (for costing)"
}

variable "component_name" {
  type        = string
  description = "Name of the component this VM instance is used by (for costing)"
}