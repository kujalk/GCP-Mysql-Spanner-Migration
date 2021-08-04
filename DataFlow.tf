resource "google_dataflow_job" "big_data_job" {
  name              = "${var.Resource-Prefix}-dataflow-job"
  template_gcs_path = "gs://dataflow-templates/latest/GCS_Text_to_Cloud_Spanner"
  temp_gcs_location = "${google_storage_bucket.csv-store.url}/temp"
  region            = var.Region

  parameters = {
    instanceId     = google_spanner_instance.main.name
    databaseId     = google_spanner_database.database.name
    importManifest = "${google_storage_bucket.csv-store.url}/manifest.json"
  }

  service_account_email = var.GCP_Service_Account

  depends_on = [
    google_storage_bucket_object.data-file
  ]
}