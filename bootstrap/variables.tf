variable "aws_region" {
  type    = string
  default = "us-east-1"
}
variable "project_name" {
  type    = string
  default = "acme"
}
variable "github_org" {
  description = "Organização ou usuário do GitHub."
  type        = string
}
variable "github_repository" {
  description = "Nome do repositório GitHub."
  type        = string
}
