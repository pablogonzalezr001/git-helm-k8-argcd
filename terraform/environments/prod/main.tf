module "vpc" {
  source = "../../modules/vpc"

  environment        = var.environment
  vpc_cidr           = "10.1.0.0/16" 
  availability_zones = ["${var.aws_region}a", "${var.aws_region}b", "${var.aws_region}c"]
  private_subnets    = ["10.1.1.0/24", "10.1.2.0/24", "10.1.3.0/24"]
  public_subnets     = ["10.1.101.0/24", "10.1.102.0/24", "10.1.103.0/24"]

  tags = var.tags
}

module "eks" {
  source = "../../modules/eks"

  environment = var.environment
  vpc_id      = module.vpc.vpc_id
  subnet_ids  = module.vpc.private_subnets
  
  # Prod uses more and larger nodes
  node_min_size     = 3
  node_desired_size = 3
  node_max_size     = 10
  node_instance_types = ["t3.large"]

  tags = var.tags
}

# The ECR registry might be shared from staging in a real world scenario,
# but for true isolation we can instantiate another registry here.
module "ecr_ai_service" {
  source = "../../modules/ecr"

  environment     = var.environment
  repository_name = "ai-service"

  tags = var.tags
}
