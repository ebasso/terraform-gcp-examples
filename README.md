# terraform-gcp-examples
Exemplos de configurações do [Terraform][tf] com a [Google Cloud Platform][gcp], do básico ao complexo ...


# Exemplos disponíveis

Cada diretório é um exemplo, veja os detalhes na tabela abaixo:

| Exemplo                       | Descrição  |
|-------------------------------|--------------------------------------------------------------------------|
| exemplo01-gcp-vm              | Cria uma VM  |
| exemplo02-python-flask        | Cria uma VM e install o Python/Flask               |


# Configurando as credenciais na Google Cloud Platform

https://cloud.google.com/community/tutorials/getting-started-on-gcp-with-terraform




# Como executar os exemplos?

Escolha um do diretórios de exemplo e e execute os comandos:


## Cloning terraform-azure-examples from git

```
cd
git clone https://github.com/ebasso/terraform-gcp-examples.git
```

## Inicializando o ambiente

```
cd terraform-aws-examples/exemplo01-gcp-vm

terraform init
```

## Criando as instâncias/objetos na AWS

```
terraform apply
```

## Deletando as instâncias/objetos na AWS

```
terraform destroy
```



# Authors

* **Enio Basso** - *Initial work* - [My Repository](https://github.com/ebasso)


# License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

# End Of file. :)

[tf]: http://terraform.io
[gcp]: https://console.cloud.google.com