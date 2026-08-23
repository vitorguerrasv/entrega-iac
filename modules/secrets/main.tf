resource "aws_secretsmanager_secret" "this" {
  name                    = "${var.secret_name}-teste"
  description             = "Segredo da aplicação ${var.name}; valor gerenciado fora do Terraform"
  recovery_window_in_days = 0

  tags = { Name = "${var.name}-secret" }
}
