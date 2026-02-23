# Hostinger KVM VPS with Kubernetes Configuration
# Since Hostinger doesn't have a Terraform provider, provision the VPS manually
# Then use this configuration to set up Kubernetes and deploy OGM.Insy

# Prerequisites:
# 1. Provision KVM2/KVM4/KVM8 VPS from Hostinger
# 2. Install Kubernetes (k3s or microk8s recommended for small VPS)
# 3. Configure kubectl access

# Example for Hostinger KVM4 (4 vCPU, 16GB RAM, 200GB NVMe)
# This is suitable for small-scale OGM.Insy deployment

# Kubernetes provider configuration
provider "kubernetes" {
  config_path = "~/.kube/config"  # Update with your kubeconfig path
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

# Namespace for OGM.Insy
resource "kubernetes_namespace" "ogm_insy" {
  metadata {
    name = "ogm-insy"
  }
}

# Storage class for Hostinger VPS (using local storage)
resource "kubernetes_storage_class" "local_storage" {
  metadata {
    name = "local-storage"
  }
  storage_provisioner = "kubernetes.io/no-provisioner"
  volume_binding_mode = "WaitForFirstConsumer"
}

# Persistent volume for data storage
resource "kubernetes_persistent_volume" "ogm_data" {
  metadata {
    name = "ogm-insy-data"
  }
  spec {
    capacity = {
      storage = "50Gi"  # Adjust based on your KVM plan
    }
    access_modes = ["ReadWriteOnce"]
    persistent_volume_source {
      local {
        path = "/mnt/ogm-data"  # Mount point on your VPS
      }
    }
    node_affinity {
      required {
        node_selector_term {
          match_expressions {
            key      = "kubernetes.io/hostname"
            operator = "In"
            values   = ["hostinger-kvm"]  # Update with your node name
          }
        }
      }
    }
  }
}

# PVC for the data volume
resource "kubernetes_persistent_volume_claim" "ogm_data" {
  metadata {
    name      = "ogm-insy-data"
    namespace = kubernetes_namespace.ogm_insy.metadata[0].name
  }
  spec {
    access_modes = ["ReadWriteOnce"]
    resources {
      requests = {
        storage = "50Gi"
      }
    }
    storage_class_name = kubernetes_storage_class.local_storage.metadata[0].name
  }
}

# Helm release for OGM.Insy
resource "helm_release" "ogm_insy" {
  name       = "ogm-insy"
  repository = "https://your-helm-repo.com"  # Or use local path
  chart      = "ogm-insy"
  namespace  = kubernetes_namespace.ogm_insy.metadata[0].name

  values = [
    file("${path.module}/values.yaml")  # Create values.yaml for Helm chart
  ]

  set {
    name  = "image.repository"
    value = "ghcr.io/yourusername/ogm-insy"
  }

  set {
    name  = "image.tag"
    value = "latest"
  }

  set {
    name  = "persistence.existingClaim"
    value = kubernetes_persistent_volume_claim.ogm_data.metadata[0].name
  }

  set {
    name  = "service.type"
    value = "ClusterIP"  # Use LoadBalancer if you have external LB
  }

  depends_on = [
    kubernetes_persistent_volume_claim.ogm_data
  ]
}

# Ingress for external access (if using ingress controller)
resource "kubernetes_ingress_v1" "ogm_insy" {
  metadata {
    name      = "ogm-insy-ingress"
    namespace = kubernetes_namespace.ogm_insy.metadata[0].name
    annotations = {
      "nginx.ingress.kubernetes.io/rewrite-target" = "/"
    }
  }

  spec {
    rule {
      host = "ogm-insy.yourdomain.com"  # Update with your domain
      http {
        path {
          path     = "/"
          path_type = "Prefix"
          backend {
            service {
              name = "ogm-insy"
              port {
                number = 8501
              }
            }
          }
        }
      }
    }
  }
}