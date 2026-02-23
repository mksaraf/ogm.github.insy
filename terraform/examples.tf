# Example: AWS EKS Cluster
# Uncomment and use this section for AWS deployment

# module "kubernetes" {
#   source = "./modules/kubernetes/aws"

#   cluster_name    = var.cluster_name
#   region         = var.region
#   node_count     = var.node_count
#   machine_type   = var.machine_type
# }

# Example: Google GKE Cluster
# Uncomment for GCP deployment

# module "kubernetes" {
#   source = "./modules/kubernetes/gcp"

#   cluster_name  = var.cluster_name
#   region       = var.region
#   node_count   = var.node_count
#   machine_type = var.machine_type
#   project_id   = var.project_id
# }

# Helm release for OGM.Insy application
resource "helm_release" "ogm_insy" {
  name       = "ogm-insy"
  repository = "./charts"  # Path to your Helm charts
  chart      = "ogm-insy"
  namespace  = "default"

  # Set values for the Helm chart
  set {
    name  = "image.repository"
    value = "ghcr.io/yourusername/ogm-insy"
  }

  set {
    name  = "image.tag"
    value = "latest"
  }

  set {
    name  = "service.type"
    value = "LoadBalancer"
  }

  depends_on = [
    # module.kubernetes  # Uncomment when using a cluster module
  ]
}

# Storage bucket for data persistence
# AWS S3 Example
# resource "aws_s3_bucket" "data_bucket" {
#   bucket = "${var.project_name}-data-${var.environment}"
# }

# Google Cloud Storage Example
# resource "google_storage_bucket" "data_bucket" {
#   name     = "${var.project_name}-data-${var.environment}"
#   location = var.region
# }