# entrega-iac

Infraestrutura AWS provisionada com Terraform.

## Secrets necessários

Para cada usuário, cadastre estes secrets no GitHub:

```text
AWS_ACCESS_KEY_ID_<USUARIO>
AWS_SECRET_ACCESS_KEY_<USUARIO>
AWS_SESSION_TOKEN_<USUARIO>
```

Usuários disponíveis: `VITOR`, `KEZIA`, `ERICA`, `IGOR` e `LEONARDO`.

As credenciais da AWS Academy são temporárias e precisam ser atualizadas quando expirarem.

## Execução pelo GitHub Actions

Os workflows são executados manualmente em **Actions > Run workflow**.

Para criar a infraestrutura:

1. Execute `Terraform Bootstrap` para criação do S3.
2. Execute `Terraform CI/CD` para criação do EC2 e EKS (principalmente).

Use `plan` para apenas validar e planejar. Use `plan/apply` para aplicar os recursos.

Para teste de provisionamento e exclusão, sigam os passos abaixo:

1. Primeiro destrua a infraestrutura (Terraform CI/CD):
Quando a ação for `plan/apply`, o job `destroy` será habilitado após o apply e aguardará aprovação no environment `DESTROY`.
Após a aprovação, o workflow do environment destrói o ambiente `dev`.

2. Em seguida, o workflow do Bootstrap (Terraform Bootstrap):
Quando a ação for `plan/apply`, o job `destroy` será habilitado após o apply e aguardará aprovação no environment `DESTROY`.
Após a aprovação, o workflow do environment destrói o S3.
