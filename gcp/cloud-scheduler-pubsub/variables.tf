variable "project" {
  type        = string
  description = "Name of the GCP project"
}

variable "region" {
  type        = string
  description = "Region for running the scheduler"
}

variable "env_name" {
  type        = string
  description = "Name of the environment"
}

variable "scheduler_name" {
  type        = string
  description = "Name of the scheduler"
}

variable "scheduler_description" {
  type        = string
  description = "Description of the scheduler"
}

variable "scheduler_setting" {
  type        = string
  description = "Schedule of the scheduler, e.g. 0 20 * * 1-5"
}

variable "scheduler_tz" {
  type        = string
  description = "Time zone of the scheduler"
  default     = "Australia/Brisbane"
}

variable "scheduler_target_topic" {
  type        = string
  description = "Pubsub topic name for execution of the scheduler"
}

variable "scheduler_target_data" {
  type        = string
  description = "Pubsub message body data for execution of the scheduler"
}
