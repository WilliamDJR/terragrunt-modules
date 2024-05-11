resource "google_cloud_scheduler_job" "scheduler_job" {
  name        = var.scheduler_name
  description = var.scheduler_description
  schedule    = var.scheduler_setting
  time_zone   = var.scheduler_tz # AEST UTC+10 Brisbane timezone
  region      = var.region       # Region where the Cloud Scheduler job will be located

  pubsub_target {
    topic_name = var.scheduler_target_topic
    data       = base64encode(var.scheduler_target_data)
  }
}