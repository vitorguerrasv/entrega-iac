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

output "eks_cluster_name" {
  description = "Nome do cluster EKS quando habilitado."
  value       = var.enable_eks ? module.eks[0].cluster_name : null
}

output "eks_cluster_endpoint" {
  description = "Endpoint do cluster EKS quando habilitado."
  value       = var.enable_eks ? module.eks[0].cluster_endpoint : null
}
