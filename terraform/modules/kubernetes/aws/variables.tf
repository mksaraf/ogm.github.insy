variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
}

variable "region" {
  description = "AWS region"
  type        = string
}

variable "node_count" {
  description = "Number of worker nodes"
  type        = number
}

variable "machine_type" {
  description = "EC2 instance type for worker nodes"
  type        = string
}