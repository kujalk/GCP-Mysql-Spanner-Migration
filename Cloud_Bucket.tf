resource "google_storage_bucket" "csv-store" {
  name          = var.Bucket
  location      = var.Region
  force_destroy = true

  uniform_bucket_level_access = true

}

resource "google_storage_bucket_iam_binding" "binding" {
  bucket = google_storage_bucket.csv-store.name
  role   = "roles/storage.admin"
  members = [
    "user:${var.Member}",
  ]

}

resource "google_storage_bucket_object" "manifest-file" {
  name   = "manifest.json"
  source = var.Manifest_Location
  bucket = google_storage_bucket.csv-store.name
}