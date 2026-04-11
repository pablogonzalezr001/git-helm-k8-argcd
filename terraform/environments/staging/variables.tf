variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "staging"
}

variable "tags" {
  description = "Default tags for resources"
  type        = map(string)
  default = {
    Environment = "staging"
    Project     = "git-helm-k8-argcd"
    ManagedBy   = "Terraform"
  }
}
