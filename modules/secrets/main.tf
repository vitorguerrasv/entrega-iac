resource "aws_secretsmanager_secret" "this" {
  name                    = var.secret_name
  description             = "Segredo da aplicação ${var.name}; valor gerenciado fora do Terraform"
  recovery_window_in_days = 7

  tags = { Name = "${var.name}-secret" }
}
