# GCF Cloud Function

Will create a GCF Cloud Function triggered by event (e.g. pubsub) for use in other modules.

## Example

```
include {
  path = find_in_parent_folders()
}

terraform {
  source = "git::git@github.com:iixlabs/yog-terraform-modules.git//terragrunt-modules/gcp/gcf-cloud-function-event-trigger?ref=master"

  extra_arguments "parent_vars" {
    commands = ["plan", "destroy"]
  }

}

inputs = {
  region = "asia-east1"
  function_use = "StartInstance"
  function_name    = "startInstancePubSub"
  function_runtime = "nodejs20"
  function_source_bucket = "<project_name>-gcf-sources-asia-east1"
  function_source_object = "startInstancePubSub.zip"
  function_entry_point  = "startInstancePubSub"
  function_trigger_type = "google.pubsub.topic.publish"
  function_trigger_resource = "projects/<project_name>/topics/tf-dev-start-instance-event-topic"
}
```
