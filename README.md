# VUTTR API

[![CircleCI](https://circleci.com/gh/nelsonmfinda/vuttr-api.svg?style=svg)](https://circleci.com/gh/nelsonmfinda/vuttr-api)
[![Maintainability](https://api.codeclimate.com/v1/badges/d7d52a50d1e28dcb84e8/maintainability)](https://codeclimate.com/github/nelsonmfinda/vuttr-api/maintainability)

API para a aplicação VUTTR (Very Useful Tools to Remember). Uma simples API para gerenciar ferramentas.

* Requisitos

  1. Ruby ~> 2.6.0 (Recomendo [rbenv](https://github.com/sstephenson/rbenv))
  2. Docker => 18.09.4
  3. PostgreSQL ~> 9.5.16
  4. Bundler => 2.0.1 (`gem install bundler` ou `bundle update --bundler`)

## Como executar

Instale as dependências do project

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

Em seguida, acesse `localhost:3000/api/v1`

## Rotas
Todas as requisições de POST para esta API devem conter o header `Content-Type: application/json`.
Esta API contém as seguintes rotas:

* `POST /auth/login` : cria uma nova sessão
* `POST /signup` : destrói uma sessão
* `GET /tools` : lista as ferramentas cadastradas
* `GET /tools/{:id}` : lista uma ferramenta através do seu _:id_ 
* `POST /tools` : cria uma nova ferramenta
* `DELETE /tools/:id` : apaga a ferramenta com  o _:id_ passado por parâmetro

Para filtrar as ferramentas em `GET /tools`, é possível:
* fazer uma busca global utilizando a query string `?q=:busca`;
* fazer uma busca por tags individuais utilizando a query string `?tags_like=:busca`.

## Exemplos

### GET /tools

Requisição:
```javascript
GET /tools
```
Resposta:
```javascript
[
    {
        id: 1,
        title: "Notion",
        link: "https://notion.so",
        description: "All in one tool to organize teams and ideas. Write, plan, collaborate, and get organized. ",
        tags: [
            "organization",
            "planning",
            "collaboration",
            "writing",
            "calendar"
        ]
    },
    {
        id: 2,
        title: "json-server",
        link: "https://github.com/typicode/json-server",
        description: "Fake REST API based on a json schema. Useful for mocking and creating APIs for front-end devs to consume in coding challenges.",
        tags: [
            "api",
            "json",
            "schema",
            "node",
            "github",
            "rest"
        ]
    },
    {
        id: 3,
        title: "fastify",
        link: "https://www.fastify.io/",
        description: "Extremely fast and simple, low-overhead web framework for NodeJS. Supports HTTP2.",
        tags: [
            "web",
            "framework",
            "node",
            "http2",
            "https",
            "localhost"
        ]
    }
]
```

### GET /tools?q=:busca

Requisição:
```javascript
GET /tools?q=notion
```
Resposta:
```javascript
[
    {
        id: 1,
        title: "Notion",
        link: "https://notion.so",
        description: "All in one tool to organize teams and ideas. Write, plan, collaborate, and get organized. ",
        tags: [
            "organization",
            "planning",
            "collaboration",
            "writing",
            "calendar"
        ]
    }
]
```

### POST /tools

Requisição:
```javascript
// POST /tools
// Content-Type: application/json
{
    "title": "hotel",
    "link": "https://github.com/typicode/hotel",
    "description": "Local app manager. Start apps within your browser, developer tool with local .localhost domain and https out of the box.",
    "tags":["node", "organizing", "webapps", "domain", "developer", "https", "proxy"]
}
```

Resposta:
```javascript
{
    "title": "hotel",
    "link": "https://github.com/typicode/hotel",
    "description": "Local app manager. Start apps within your browser, developer tool with local .localhost domain and https out of the box.",
    "tags":["node", "organizing", "webapps", "domain", "developer", "https", "proxy"],
    "id":5
}
```

### DELETE /tools/:id
Requisição:
```javascript
DELETE /tools/5
```

Resposta:
```javascript
// Status: 200 OK
{}
```
