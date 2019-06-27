#language: pt

@tool @login
Funcionalidade: Manter Dados de Ferramentas

Contexto: Login
    Dado que o usuário esteja logado na API

Cenário: Cadastrar uma Ferramenta
    Dado o endpoint da API para cadastrar uma Ferramenta
    Quando realizar uma requisição para cadastrar uma Ferramenta
    Então a API irá retornar os dados do cadastro da Ferramenta
    Então respondendo com o código 201

Cenário: Listar Ferramenta por id
    Quando realizar a requisição para consultar uma ferramenta por id
    Dado que a API retorna o código 200
    Então o corpo da resposta terá os dados da ferramenta

Cenário: Apagar Ferramenta por id
    Quando realizar a requisição para apagar a ferramenta
    Então a API retorna o código 204

Cenário: Filtrar Ferramenta por tag
    Quando realizar a requisição para consultar uma Ferramenta por tag
    Então respondendo com o código de estado 200
