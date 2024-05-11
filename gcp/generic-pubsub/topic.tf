resource "google_pubsub_topic" "topic" {

  #checkov:skip=CKV_GCP_83:Add this at a later date

  name = "tf-${var.env_name}-${var.product_name}-${var.name}-topic"

  labels = local.labels

  depends_on = [
    google_project_service.enabled-apis
  ]
}

# SA for all services publishing to this
resource "google_pubsub_topic_iam_member" "topic-publishers" {

  #checkov:skip= CKV_GCP_99:This is a pointless check, there's only a Service Account given access here

  for_each = toset(var.topic_publisher_service_accounts)
  topic    = google_pubsub_topic.topic.name
  role     = "roles/pubsub.publisher"
  member   = "serviceAccount:${each.key}"
}
