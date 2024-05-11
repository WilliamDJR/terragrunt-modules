resource "google_storage_bucket_iam_member" "object-creator" {
  for_each = toset(var.object_creator_sas)
  bucket   = google_storage_bucket.storage_bucket.name
  member   = "serviceAccount:${each.key}"
  role     = "roles/storage.objectCreator"
}

resource "google_storage_bucket_iam_member" "object-viewer" {
  for_each = toset(var.object_viewer_sas)
  bucket   = google_storage_bucket.storage_bucket.name
  member   = "serviceAccount:${each.key}"
  role     = "roles/storage.objectViewer"
}

resource "google_storage_bucket_iam_member" "object-admin" {
  for_each = toset(var.object_admin_sas)
  bucket   = google_storage_bucket.storage_bucket.name
  member   = "serviceAccount:${each.key}"
  role     = "roles/storage.objectAdmin"
}

resource "google_storage_bucket_iam_member" "legacy-bucket-reader" {
  for_each = toset(var.legacy_bucket_reader_sas)
  bucket   = google_storage_bucket.storage_bucket.name
  member   = "serviceAccount:${each.key}"
  role     = "roles/storage.legacyBucketReader"
}

resource "google_storage_bucket_iam_member" "legacy-bucket-writer" {
  for_each = toset(var.legacy_bucket_writer_sas)
  bucket   = google_storage_bucket.storage_bucket.name
  member   = "serviceAccount:${each.key}"
  role     = "roles/storage.legacyBucketWriter"
}

resource "google_storage_bucket_iam_member" "legacy-object-owner" {
  for_each = toset(var.legacy_object_owner_sas)
  bucket   = google_storage_bucket.storage_bucket.name
  member   = "serviceAccount:${each.key}"
  role     = "roles/storage.legacyObjectOwner"
}

resource "google_storage_bucket_iam_member" "user-object-viewer" {
  for_each = toset(var.object_viewer_users)
  bucket   = google_storage_bucket.storage_bucket.name
  member   = "user:${each.key}"
  role     = "roles/storage.objectViewer"
}

resource "google_storage_bucket_iam_member" "user-object-user" {
  for_each = toset(var.object_user_users)
  bucket   = google_storage_bucket.storage_bucket.name
  member   = "user:${each.key}"
  role     = "roles/storage.objectUser"
}

# # Make bucket public
# resource "google_storage_bucket_iam_member" "public-bucket" {
#   count = var.enable_public_bucket ? 1 : 0

#   bucket = google_storage_bucket.storage_bucket.name
#   # Grants read to objects but not list permission
#   role   = "roles/storage.legacyObjectReader"
#   member = "allUsers"
# }
