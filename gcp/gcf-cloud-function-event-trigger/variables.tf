variable "project" {
  type        = string
  description = "Name of the GCP project"
}

variable "region" {
  type        = string
  description = "Region to deploy the Cloud Function to"
}

variable "env_name" {
  type        = string
  description = "Name of the environment"
}

variable "function_name" {
  type        = string
  description = "Name of the function to create"
}

variable "function_runtime" {
  type        = string
  description = "Runtime of the function to create, e.g. nodejs20"
}


variable "function_use" {
  type        = string
  description = "One or two word description about what the function is to be used for."
}

variable "function_source_bucket" {
  type        = string
  description = "The bucket name for the function source code storage."
}

variable "function_source_object" {
  type        = string
  description = "The archived object name (.zip) for the function source code."
}

variable "function_entry_point" {
  type        = string
  description = "The entry point name for the function."
}

variable "function_trigger_type" {
  type        = string
  description = "The event trigger type for the function."
}

variable "function_trigger_resource" {
  type        = string
  description = "The event trigger resource for the function, e.g. projects/pccw-dev/topics/tf-dev-stop-instance-event-topic"
}


