variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "prod"
}

variable "tags" {
  description = "Default tags for resources"
  type        = map(string)
  default = {
    Environment = "prod"
    Project     = "git-helm-k8-argcd"
    ManagedBy   = "Terraform"
  }
}
