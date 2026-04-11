variable "environment" {
  type        = string
  description = "Environment name (e.g. staging, prod)"
}

variable "vpc_cidr" {
  type        = string
  description = "CIDR block for VPC"
}

variable "availability_zones" {
  type        = list(string)
  description = "A list of availability zones names in the region"
}

variable "private_subnets" {
  type        = list(string)
  description = "A list of private subnets inside the VPC"
}

variable "public_subnets" {
  type        = list(string)
  description = "A list of public subnets inside the VPC"
}

variable "tags" {
  type        = map(string)
  description = "A map of tags to add to all resources"
  default     = {}
}
