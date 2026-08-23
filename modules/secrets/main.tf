resource "aws_secretsmanager_secret" "this" {
  name                          = "${var.secret_name}-teste"
  description                   = "Segredo da aplicação ${var.name}; valor gerenciado fora do Terraform"
  force_delete_without_recovery = true

  tags = { Name = "${var.name}-secret" }
}
