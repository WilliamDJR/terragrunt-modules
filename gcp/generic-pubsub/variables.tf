variable "project" {
  type        = string
  description = "Name of the GCP project"
}

variable "product_name" {
  type        = string
  description = ""
  default     = "console-core"
}

variable "name" {
  type        = string
  description = ""
}

variable "env_name" {
  type        = string
  description = "Name of the environment, servers will be prefixed with this name"
}

variable "message_retention_duration" {
  type = string

  description = <<DOCS
How long to retain unacknowledged messages in the subscription's backlog,
from the moment a message is published.
Default is 20 minutes.
DOCS

  default = "1200s"
}

variable "topic_publisher_service_accounts" {
  type    = list(string)
  default = []
}

variable "topic_subscriber_service_accounts" {
  type    = list(string)
  default = []
}

variable "topic_subscriber_iam_accounts" {
  type    = list(string)
  default = []
}

variable "filter" {
  type        = string
  default     = null
  description = "The subscription only delivers the messages that match the filter."
}
