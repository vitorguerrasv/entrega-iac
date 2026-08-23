data "aws_availability_zones" "available" {
  state = "available"
}

locals {
  name = "${var.project_name}-${var.environment}"

  common_tags = {
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "Terraform"
    Owner       = "CloudEngineering"
  }
}

module "network" {
  source = "../../modules/network"

  name                = local.name
  vpc_cidr            = var.vpc_cidr
  availability_zones  = slice(data.aws_availability_zones.available.names, 0, 2)
  public_subnet_cidrs = var.public_subnet_cidrs
  allowed_http_cidrs  = var.allowed_http_cidrs
}

module "secrets" {
  source = "../../modules/secrets"

  name        = local.name
  secret_name = "${var.project_name}/${var.environment}/application"
}

module "ec2" {
  source = "../../modules/ec2"

  name              = local.name
  instance_type     = var.instance_type
  subnet_id         = module.network.public_subnet_ids[0]
  security_group_id = module.network.web_security_group_id
  secret_arn        = module.secrets.secret_arn
}

module "ecs" {
  count  = var.enable_ecs ? 1 : 0
  source = "../../modules/ecs"

  name              = local.name
  vpc_id            = module.network.vpc_id
  public_subnet_ids = module.network.public_subnet_ids
  alb_security_group_id = module.network.alb_security_group_id
  ecs_security_group_id = module.network.ecs_security_group_id
  container_image   = var.ecs_container_image
}
