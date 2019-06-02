# VUTTR API

[![CircleCI](https://circleci.com/gh/nelsonmfinda/vuttr-api.svg?style=svg)](https://circleci.com/gh/nelsonmfinda/vuttr-api)
[![Maintainability](https://api.codeclimate.com/v1/badges/d7d52a50d1e28dcb84e8/maintainability)](https://codeclimate.com/github/nelsonmfinda/vuttr-api/maintainability)

API para a aplicação VUTTR (Very Useful Tools to Remember). Uma simples API para gerenciar ferramentas. [Documentação da API](https://vuttrapiv1.docs.apiary.io/)

* Requisitos

  1. Ruby ~> 2.6.0 (Recomendo [rbenv](https://github.com/sstephenson/rbenv))
  2. Docker => 18.09.4
  3. Docker-compose => 1.23.1
  4. PostgreSQL ~> 9.5.16
  5. Bundler => 2.0.1 (`gem install bundler` ou `bundle update --bundler`)

## Como executar

Instale as dependências do projecto

```sh
  bundle install
```

Crie e inicialize a base de dados

```sh
    bundle exec rails db:create db:migrate db:seed db:test:prepare
```

Execute os testes

```sh
    bundle exec rspec
```

Rode o projecto em sua máquina

```sh
    bundle exec rails s
```

Em seguida, crie um novo usuário:

### POST /signup

Requisição:
```javascript
// POST /signup
// Content-Type: application/json
{
  "name": "seu nome",
  "email": "seu emial",
  "password": "sua senha",
	"password_confirmation": "confirme sua senha"
}
```

Resposta:
```javascript
{
  "message": "Account created successfully",
  "auth_token": "aqui aparecerá o seu Token"
}
```

Exemplo de um `auth_token`: _eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo2Mz_

Agora, acesse `localhost:3000/api/v1/tools` passando o `auth_token`, como neste exemplo:

### GET /tools

Requisição:
```javascript
// GET /tools
// Content-Type: application/json
// Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHBpcmF0aW9uIjoxNTU4MjgxNDk5fQ.pXkSaG4tzP2-PJx0yIeNLy5nuoFoJegXu18AFeioAQE
```

Resposta:

```javascript
{
  "id": 1,
  "title": "json-server",
  "link": "https://github.com/typicode/json-server",
  "description": "Fake REST API based on a json schema. Useful for mocking and creating APIs for front-end devs to consume in coding challenges.",
  "tags": [
      "api",
      "json",
      "schema",
      "node",
      "github",
      "rest"
  ],
  "created_by": "1"
 }
```



## Rotas

Todas as requisições para esta API devem conter o header `Content-Type: application/json` e um `Bearer Token`(Faça _login_ ou _signup_ para ter o seu `Bearer Token`).
Esta API contém as seguintes rotas:

* `POST /auth/login` : cria uma nova sessão
* `POST /signup` : cadastrar um novo usuário
* `GET /tools` : lista as ferramentas cadastradas
* `GET /tools/:id` : lista uma ferramenta através do seu _:id_
* `POST /tools` : cria uma nova ferramenta
* `DELETE /tools/:id` : apaga a ferramenta com  o _:id_ passado por parâmetro

Para filtrar as ferramentas em `GET /tools`, é possível:
* fazer uma busca por tags individuais utilizando a query string `?tag=:busca`.

