variable "Project-ID" {
  type        = string
  description = "Project ID"
}

variable "Resource-Prefix" {
  type        = string
  description = "Prefix that will be added to resources"
}

variable "Region" {
  type        = string
  description = "Region for the resources"
}

variable "Manifest_Location" {
  type        = string
  description = "Manifest File Location"
}

variable "CSV_Location" {
  type        = string
  description = "CSV File Location"
}

variable "Member" {
  type        = string
  description = "Member for permissions"
}

variable "GCP_Service_Account" {
  type        = string
  description = "GCP Service Account"
}

variable "Bucket" {
  type        = string
  description = "Bucket name"
}

