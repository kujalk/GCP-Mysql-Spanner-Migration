resource "google_spanner_instance" "main" {
  name          = "${var.Resource-Prefix}-spanner"
  config        = "regional-${var.Region}"
  display_name  = "${var.Resource-Prefix} Spanner Instance"
  num_nodes     = 1
  force_destroy = true
  labels = {
    "project" = "${var.Resource-Prefix}-project"
  }
}

resource "google_spanner_database" "database" {
  instance = google_spanner_instance.main.name
  name     = "${var.Resource-Prefix}-database"
  ddl = [
    "CREATE TABLE  CountryLanguage (Country STRING(100) NOT NULL,City STRING(100) NOT NULL,Language STRING(100) NOT NULL) PRIMARY KEY (City)",
  ]
  deletion_protection = false
}

resource "google_spanner_instance_iam_binding" "instance" {
  instance = google_spanner_instance.main.name
  role     = "roles/spanner.admin"

  members = [
    "user:${var.Member}",
  ]
}

resource "google_spanner_database_iam_binding" "database" {
  instance = google_spanner_instance.main.name
  database = google_spanner_database.database.name
  role     = "roles/spanner.databaseAdmin"

  members = [
    "user:${var.Member}",
  ]
}