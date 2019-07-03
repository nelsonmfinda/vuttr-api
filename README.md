# VUTTR API

[![CircleCI](https://circleci.com/gh/nelsonmfinda/vuttr-api.svg?style=svg)](https://circleci.com/gh/nelsonmfinda/vuttr-api)
[![Maintainability](https://api.codeclimate.com/v1/badges/d7d52a50d1e28dcb84e8/maintainability)](https://codeclimate.com/github/nelsonmfinda/vuttr-api/maintainability)
[![security](https://hakiri.io/github/nelsonmfinda/vuttr-api/master.svg)](https://hakiri.io/github/nelsonmfinda/vuttr-api/master)
[![Coverage Status](https://coveralls.io/repos/github/nelsonmfinda/vuttr-api/badge.svg?branch=master)](https://coveralls.io/github/nelsonmfinda/vuttr-api?branch=master)

API para a aplicação VUTTR (Very Useful Tools to Remember). Uma simples API para gerenciar ferramentas. [Documentação da API](https://vuttrapiv1.docs.apiary.io/)

## Pré-requisitos

- Possuir Ruby **~> 2.6.0** (Recomendo instalar via [rbenv](https://github.com/sstephenson/rbenv))
- PostgreSQL ~> 9.5.16
- Bundler => 2.0.1 (`gem install bundler` ou `bundle update --bundler`)

## 1) Instalando dependências

Instale as dependências do projecto

```sh
  bundle install
```

## 2) Executando Projeto

Crie e inicialize a base de dados

```sh
    bundle exec rails db:create db:migrate db:test:prepare
```

Na pasta raiz do projeto rode o comando:

```sh
    bundle exec rspec
```

e

```sh
    bundle exec cucumber
```

Rode o projecto em sua máquina, e em seguida visite: <http://localhost:3000/api/v1>

```sh
    bundle exec rails s
```

Será preciso, criar um usuário:

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

Agora renomeie o arquivo ```features/support/config/development.example.yml``` para ```features/support/config/development.yml```, e edite informando o ```email``` e ```password``` cadastrado.

> ***O token gerado, tem validade de 24h desde o momento da criação.***

## Rotas

Todas as requisições para esta API devem conter o header `Content-Type: application/json` e um `Bearer Token`(Faça _login_ ou _signup_ para ter o seu `Bearer Token`).
Esta API contém as seguintes rotas:

- `POST /auth/login` : cria uma nova sessão
- `POST /signup` : cadastrar um novo usuário
- `GET /tools` : lista as ferramentas cadastradas
- `GET /tools/:id` : lista uma ferramenta através do seu _:id_
- `POST /tools` : cria uma nova ferramenta
- `DELETE /tools/:id` : apaga a ferramenta com o _:id_ passado por parâmetro

Para filtrar as ferramentas em `GET /tools`, é possível:

- fazer uma busca por tags individuais utilizando a query string `?tag=:busca`.

## 3) Documentação da API

Link da [documentação](https://vuttrapiv1.docs.apiary.io/#) usando o padrão API Blueprint.

## 4) Link da API

<http://vuttr-api.herokuapp.com/api/v1>
