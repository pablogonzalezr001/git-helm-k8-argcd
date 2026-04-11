variable "environment" {
  type        = string
  description = "Environment name"
}

variable "repository_name" {
  type        = string
  description = "Name of the ECR repository"
}

variable "tags" {
  type        = map(string)
  description = "A map of tags to add to all resources"
  default     = {}
}
