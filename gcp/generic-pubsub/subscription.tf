resource "google_pubsub_subscription" "topic-subscription" {
  name  = "tf-${var.env_name}-${var.product_name}-${var.name}-topic-subscription"
  topic = google_pubsub_topic.topic.name

  labels = local.labels

  message_retention_duration = var.message_retention_duration
  retain_acked_messages      = false

  ack_deadline_seconds = 20
  filter               = var.filter
}

resource "google_pubsub_subscription_iam_member" "topic-subscribers" {
  for_each     = toset(var.topic_subscriber_service_accounts)
  subscription = google_pubsub_subscription.topic-subscription.name
  role         = "roles/pubsub.subscriber"
  member       = "serviceAccount:${each.key}"
}

resource "google_pubsub_subscription_iam_member" "topic-subscribers-users" {
  for_each     = toset(var.topic_subscriber_iam_accounts)
  subscription = google_pubsub_subscription.topic-subscription.name
  role         = "roles/pubsub.subscriber"
  member       = "user:${each.key}"
}
