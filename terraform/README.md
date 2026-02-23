# Terraform Configuration for OGM.Insy Infrastructure

This directory contains Terraform configurations to provision the infrastructure
required for deploying the OGM.Insy AI-powered semantic search platform.

## Supported Platforms

### Major Cloud Providers
- **AWS (Amazon Web Services)**: Uses EKS for Kubernetes
- **Google Cloud Platform**: Uses GKE for Kubernetes
- **Microsoft Azure**: Uses AKS for Kubernetes

### Hostinger KVM VPS (Budget Option)
- **KVM2**: 2 vCPU, 8GB RAM, 100GB NVMe - $6.99/mo
- **KVM4**: 4 vCPU, 16GB RAM, 200GB NVMe - $9.99/mo
- **KVM8**: 8 vCPU, 32GB RAM, 400GB NVMe - $19.99/mo

Hostinger KVM plans provide full root access and support Docker/Kubernetes installation.
Use `hostinger-kvm.tf` for configuration after manual VPS provisioning.

## Quick Start

1. Choose your platform and follow the setup instructions
2. Configure variables in `terraform.tfvars`
3. Initialize: `terraform init`
4. Plan: `terraform plan`
5. Apply: `terraform apply`

## Hostinger KVM Setup Steps

1. **Provision VPS**: Get KVM2/4/8 from Hostinger control panel
2. **Install Kubernetes**: Use k3s or microk8s for easy setup
3. **Configure Access**: Set up kubectl and kubeconfig
4. **Run Terraform**: Use `hostinger-kvm.tf` to deploy OGM.Insy

## Variables

Configure in `terraform.tfvars`:
- `project_name`: Project name
- `environment`: dev/staging/prod
- `region`: Cloud region
- `cluster_name`: K8s cluster name
- `node_count`: Number of nodes
- `machine_type`: Instance type

## Integration with OGM.Insy

Terraform handles:
- Kubernetes namespace creation
- Storage configuration
- Helm chart deployment
- Ingress setup
- Service configuration