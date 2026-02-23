variable "project_name" {
  description = "Name of the project"
  type        = string
  default     = "ogm-insy"
}

variable "environment" {
  description = "Environment (dev, staging, prod)"
  type        = string
  default     = "dev"
}

variable "region" {
  description = "Cloud region"
  type        = string
  default     = "us-east-1"  # AWS default
}

variable "cluster_name" {
  description = "Kubernetes cluster name"
  type        = string
  default     = "ogm-insy-cluster"
}

variable "project_id" {
  description = "Google Cloud Project ID"
  type        = string
  default     = "your-gcp-project-id"
}

variable "node_count" {
  description = "Number of nodes in the Kubernetes cluster"
  type        = number
  default     = 3
}

variable "machine_type" {
  description = "Machine type for cluster nodes"
  type        = string
  default     = "t3.medium"  # AWS
  # For GCP: "e2-medium"
  # For Azure: "Standard_DS2_v2"
}