# entrega-iac

Infraestrutura AWS provisionada com Terraform.

## Execução pelo GitHub Actions

Os workflows são executados manualmente em **Actions > Run workflow**.

Para criar a infraestrutura:

1. Execute `Terraform Bootstrap` com a ação `plan` ou `plan/apply`.
2. Execute `Terraform CI/CD` com `plan` ou `plan/apply`.

Use `plan` para apenas validar e planejar. Use `plan/apply` para aplicar os recursos.

Para destruir a infraestrutura:

Quando a ação for `plan/apply`, o job `destroy` será habilitado após o apply e aguardará aprovação no environment `DESTROY`.

Após a aprovação, o workflow do environment destrói o ambiente `dev`. Em seguida, o workflow do Bootstrap deve ser executado novamente com `plan/apply` para destruir o bucket de state.

Os jobs de destruição dos dois workflows exigem aprovação no environment `DESTROY`.

## Secrets necessários

Para cada usuário, cadastre estes secrets no GitHub:

```text
AWS_ACCESS_KEY_ID_<USUARIO>
AWS_SECRET_ACCESS_KEY_<USUARIO>
AWS_SESSION_TOKEN_<USUARIO>
```

Usuários disponíveis: `VITOR`, `KEZIA`, `ERICA`, `IGOR` e `LEONARDO`.

As credenciais da AWS Academy são temporárias e precisam ser atualizadas quando expirarem. Nunca armazene credenciais no repositório.