#language: pt
@login
Funcionalidade: Autenticação

Cenário: Efetuando login
    Quando realizar a requisição para logar na API
    Então o sistema retorna o código 200
    Então a API retorna o token de acesso
