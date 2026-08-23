variable "aws_region" {
  type    = string
  default = "us-east-1"
}
variable "project_name" {
  type    = string
  default = "acme"
}
variable "github_org" {
  description = "vitorguerrasv"
  type        = string
}
variable "github_repository" {
  description = "entrega-iac"
  type        = string
}
