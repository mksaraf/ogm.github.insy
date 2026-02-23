terraform {
  required_providers {
    # Uncomment and configure the provider for your cloud platform

    # AWS Provider
    # aws = {
    #   source  = "hashicorp/aws"
    #   version = "~> 5.0"
    # }

    # Google Cloud Provider
    # google = {
    #   source  = "hashicorp/google"
    #   version = "~> 5.0"
    # }

    # Azure Provider
    # azurerm = {
    #   source  = "hashicorp/azurerm"
    #   version = "~> 3.0"
    # }

    # Hostinger VPS - Manual Provisioning Required
    # Note: Hostinger doesn't have a Terraform provider
    # Provision KVM VPS manually, then use Kubernetes provider

    # Helm Provider for deploying applications
    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.0"
    }

    # Kubernetes Provider (for Hostinger KVM with K8s)
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.0"
    }
  }
}

# AWS Provider Configuration (uncomment and configure)
# provider "aws" {
#   region = var.region
# }

# Google Cloud Provider Configuration
# provider "google" {
#   project = var.project_id
#   region  = var.region
# }

# Azure Provider Configuration
# provider "azurerm" {
#   features {}
# }

# Helm Provider (connects to Kubernetes cluster)
provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

# Kubernetes Provider
provider "kubernetes" {
  config_path = "~/.kube/config"
}