module "vpc" {
  source = "../../modules/vpc"

  environment        = var.environment
  vpc_cidr           = "10.0.0.0/16"
  availability_zones = ["${var.aws_region}a", "${var.aws_region}b"]
  private_subnets    = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets     = ["10.0.101.0/24", "10.0.102.0/24"]

  tags = var.tags
}

module "eks" {
  source = "../../modules/eks"

  environment = var.environment
  vpc_id      = module.vpc.vpc_id
  subnet_ids  = module.vpc.private_subnets
  
  # Staging uses smaller/fewer nodes
  node_min_size     = 1
  node_desired_size = 2
  node_max_size     = 3
  node_instance_types = ["t3.medium"]

  tags = var.tags
}

module "ecr_ai_service" {
  source = "../../modules/ecr"

  environment     = var.environment
  repository_name = "ai-service"

  tags = var.tags
}
