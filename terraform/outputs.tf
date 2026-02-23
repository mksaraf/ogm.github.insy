output "cluster_endpoint" {
  description = "Kubernetes cluster endpoint"
  value       = try(module.kubernetes.cluster_endpoint, null)
}

output "cluster_name" {
  description = "Kubernetes cluster name"
  value       = var.cluster_name
}

output "region" {
  description = "Cloud region"
  value       = var.region
}

output "helm_release_status" {
  description = "Status of the Helm release"
  value       = try(helm_release.ogm_insy.status, null)
}