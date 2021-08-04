Purpose - Terraform template to migrate CSV file to GCP Spanner via GCP dataflow
Dataflow Template used - Cloud Storage Text to Cloud Spanner
Developer - K.Janarthanan

Pre-Requisites
---------------
[1] Must have a GCP project with following API enabled
    - spanner api
    - storage api
    - dataflow api
[2] Create a service account in the GCP project which has access to creation of resources using Terraform. 
    Download it's key which is JSON format
[3] Refer "Requirements for this pipeline" for section "Cloud Storage Text to Cloud Spanner" in page https://cloud.google.com/dataflow/docs/guides/templates/provided-batch#gcs_text_to_cloud_spanner

Resources created
-------------------
[1] GCP Spanner Instance
[2] GCP Spanner Database
[3] GCP Dataflow Job with "Cloud Storage Text to Cloud Spanner" template 
[4] GCP Cloud Storage Bucket
[5] Roles for accessing Bucket, Spanner 
[6] Uploading Manifest file and CSV file

Method
-------
[1] Fill the values in Provider.tf and terraform.tfvars
[2] terraform init
[3] terraform plan - To check all resources which will be created
[4] terraform apply -> Provide "yes" for confirmation
[5] terraform destroy -> Provide "yes" for confirmation also Make sure to stop the job before applying the "terraform destroy"

Extra Info
------------
Dataflow Template info  - https://cloud.google.com/dataflow/docs/guides/templates/provided-batch#gcloud_15
Migration - https://cloud.google.com/architecture/migrating-mysql-to-spanner
In any case, if Dataflow job has failed due to capacity issue in Region, retry the job by cloning the job
