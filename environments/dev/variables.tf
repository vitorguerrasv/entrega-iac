variable "aws_region" {
  description = "Região AWS utilizada pelo ambiente."
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Nome curto do projeto."
  type        = string
  default     = "acme"
}

variable "environment" {
  description = "Nome do ambiente."
  type        = string
  default     = "dev"
}

variable "vpc_cidr" {
  description = "CIDR da VPC."
  type        = string
  default     = "10.20.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "CIDRs das sub-redes públicas."
  type        = list(string)
  default     = ["10.20.10.0/24", "10.20.20.0/24"]

  validation {
    condition     = length(var.public_subnet_cidrs) >= 2
    error_message = "Informe pelo menos duas sub-redes para suportar múltiplas AZs."
  }
}

variable "instance_type" {
  description = "Tipo da instância EC2."
  type        = string
  default     = "t3.micro"
}

variable "allowed_http_cidrs" {
  description = "CIDRs permitidos na porta HTTP. Em produção, restrinja esta lista."
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "enable_ecs" {
  description = "Ativa o bônus de cluster ECS/Fargate."
  type        = bool
  default     = false
}

variable "ecs_container_image" {
  description = "Imagem inicial do container ECS."
  type        = string
  default     = "nginx:alpine"
}
