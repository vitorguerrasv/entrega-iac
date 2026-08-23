output "vpc_id" {
  description = "ID da VPC."
  value       = module.network.vpc_id
}

output "ec2_instance_id" {
  description = "ID da instância EC2."
  value       = module.ec2.instance_id
}

output "ec2_public_url" {
  description = "URL pública da aplicação na EC2."
  value       = "http://${module.ec2.public_dns}"
}

output "secret_arn" {
  description = "ARN do segredo. O valor do segredo não é exposto."
  value       = module.secrets.secret_arn
}

output "ecs_alb_url" {
  description = "URL do ALB do ECS quando habilitado."
  value       = var.enable_ecs ? "http://${module.ecs[0].alb_dns_name}" : null
}

output "ecr_repository_url" {
  description = "Repositório ECR quando o ECS está habilitado."
  value       = var.enable_ecs ? module.ecs[0].ecr_repository_url : null
}
