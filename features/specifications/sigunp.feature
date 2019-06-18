#language: pt
@signup
Funcionalidade: Cadastro de Usuário

Cenário: Efetuando signup
    Quando realizar a requisição para fazer signup na API
    Então a API retorna o código de estado 201
    Então a API retorna o token de acesso com a mensagem "Account created successful"
