# Projeto Banco

## Versões Utilizadas
- Ruby: 3.3.0
- Rails: 8.0.1
- Postgresql

## Instalação

Para instalar o projeto, siga os passos abaixo:

1. Clone o repositório:
  ```bash
  git clone git@github.com:jorgecoutinhobr/bank_on_rails.git
  ```
2. Navegue até o diretório do projeto:
  ```bash
  cd bank_on_rails
  ```
3. Instale as dependências:
  ```bash
  bundle install
  ```
4. Configure o banco de dados:
```bash
  rails db:create
  rails db:migrate
  rails db:seed
```
5. Inicie o Servidor
```bash
  rails s
```
6. Para logar utilize um dos usuarios criados:
  - Normal login: 12345 / password: 1234
  - VIP login: 54321 / password: 1234
7. Caso queira criar um usuário, um email é enviado com a conta de acesso. Veja os logs para acessar o conteúdo do email.

