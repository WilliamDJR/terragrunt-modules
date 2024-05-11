variable "project" {
  type        = string
  description = "Name of the GCP project"
}

variable "env_name" {
  type        = string
  description = "Name of the environment"
}

variable "bucket_name" {
  type        = string
  description = "Name of the bucket to create"
}

variable "bucket_use" {
  type        = string
  description = "One or two word description about what the bucket is to be used for. Applied as a label to the bucket"
}

variable "bucket_storage_class" {
  type        = string
  default     = "STANDARD"
  description = <<DESC
The storage class of the bucket.
See Google's docs for more information.
https://cloud.google.com/storage/docs/storage-classes
DESC
}

variable "versioning_enabled" {
  type        = bool
  default     = false
  description = <<DESC
Whether to enable bucket versioning or not.
See Google's docs for more information.
https://cloud.google.com/storage/docs/object-versioning
DESC
}

variable "region" {
  type        = string
  description = "Region to deploy the GCS bucket to"
}

variable "object_creator_sas" {
  type        = list(string)
  description = "List of Service Accounts to grant Storage Object Creator permission"
  default     = []
}

variable "object_viewer_sas" {
  type        = list(string)
  description = "List of Service Accounts to grant Storage Object Viewer permission"
  default     = []
}

variable "object_admin_sas" {
  type        = list(string)
  description = "List of Service Accounts to grant Storage Object Admin permission"
  default     = []
}

variable "legacy_bucket_reader_sas" {
  type        = list(string)
  description = "List of Service Accounts to grant Storage Legacy Bucket Reader permission"
  default     = []
}

variable "legacy_bucket_writer_sas" {
  type        = list(string)
  description = "List of Service Accounts to grant Storage Legacy Bucket Writer permission"
  default     = []
}

variable "legacy_object_owner_sas" {
  type        = list(string)
  description = "List of Service Accounts to grant Storage Legacy Object Owner permission"
  default     = []
}

variable "object_viewer_users" {
  type        = list(string)
  description = "List of Users to grant read-only (Storage Object Viewer) permission"
  default     = []
}

variable "object_user_users" {
  type        = list(string)
  description = "List of Users to grant read-write (Storage Object User) permission"
  default     = []
}

# variable "enable_public_bucket" {
#   type        = bool
#   default     = false
#   description = "Will make the contents of this GCS bucket public. Enable with caution!"
# }

variable "lifecycle_rules" {
  description = "The bucket's Lifecycle Rules configuration."
  type = list(object({
    # Object with keys:
    # - type - The type of the action of this Lifecycle Rule. Supported values: Delete and SetStorageClass.
    # - storage_class - (Required if action type is SetStorageClass) The target Storage Class of objects affected by this Lifecycle Rule.
    action = any

    # Object with keys:
    # - age - (Optional) Minimum age of an object in days to satisfy this condition.
    # - created_before - (Optional) Creation date of an object in RFC 3339 (e.g. 2017-06-13) to satisfy this condition.
    # - with_state - (Optional) Match to live and/or archived objects. Supported values include: "LIVE", "ARCHIVED", "ANY".
    # - matches_storage_class - (Optional) Storage Class of objects to satisfy this condition. Supported values include: MULTI_REGIONAL, REGIONAL, NEARLINE, COLDLINE, STANDARD, DURABLE_REDUCED_AVAILABILITY.
    # - matches_prefix - (Optional) One or more matching name prefixes to satisfy this condition.
    # - matches_suffix - (Optional) One or more matching name suffixes to satisfy this condition
    # - num_newer_versions - (Optional) Relevant only for versioned objects. The number of newer versions of an object to satisfy this condition.
    condition = any
  }))
  default = []
}

variable "prefix_bucket_name_with_project_id" {
  type    = bool
  default = true
}
