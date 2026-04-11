variable "environment" {
  type        = string
  description = "Environment name"
}

variable "cluster_version" {
  type        = string
  description = "Kubernetes version"
  default     = "1.30"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID where the cluster and nodes will be deployed"
}

variable "subnet_ids" {
  type        = list(string)
  description = "A list of subnet IDs where the nodes/node groups will be provisioned"
}

variable "node_min_size" {
  type        = number
  description = "Minimum number of nodes"
  default     = 1
}

variable "node_max_size" {
  type        = number
  description = "Maximum number of nodes"
  default     = 3
}

variable "node_desired_size" {
  type        = number
  description = "Desired number of nodes"
  default     = 2
}

variable "node_instance_types" {
  type        = list(string)
  description = "List of EC2 instance types for the EKS node group"
  default     = ["t3.medium"]
}

variable "tags" {
  type        = map(string)
  description = "A map of tags to add to all resources"
  default     = {}
}
