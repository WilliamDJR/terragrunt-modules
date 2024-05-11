resource "google_cloudfunctions_function" "google_cloud_function" {
  name    = var.function_name
  runtime = var.function_runtime

  source_archive_bucket = var.function_source_bucket
  source_archive_object = var.function_source_object

  entry_point  = var.function_entry_point

  event_trigger {
    event_type = var.function_trigger_type
    resource   = var.function_trigger_resource
  }
}