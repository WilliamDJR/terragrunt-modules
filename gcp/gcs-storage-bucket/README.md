# GCS Storage Bucket

Will create a GCS storage bucket for use in other modules.

## Example

```
include {
  path = find_in_parent_folders()
}

terraform {
  source = "git::git@github.com:iixlabs/yog-terraform-modules.git//terragrunt-modules/gcp/gcs-storage-bucket?ref=master"

  extra_arguments "parent_vars" {
    commands = ["plan", "destroy"]
  }

}

inputs = {
  region      = "asia-east1"
  bucket_name = "dev-api-elasticsearch-backups"
  bucket_use  = "elasticsearch-backups"
}
```

## Inputs

| Name | Description |
|------|-------------|
| region | The region to create the bucket in |
| bucket_name | Name of the bucket, will have the project name prepended to it (we need to ensure bucket names are unique GCS wide). |
| bucket_use | Description of what the bucket will be used for. Added to the bucket as a label. Don't include spaces in this. |
| versioning_enabled | Whether to enable [bucket versioning](https://cloud.google.com/storage/docs/object-versioning) or not |

## Outputs

| Name | Description |
|------|-------------|
| name | The name of the bucket (basically `"${var.project}-${var.bucket_name}"`) |
