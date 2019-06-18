Quando("realizar a requisição para logar na API") do
  $response = @login.post_login
  expect($response).to match_json_schema("login")
end

Então("o sistema retorna o código {int}") do |status_code|
  expect($response.code).to eq(status_code)
end

Então("a API retorna o token de acesso") do
  $token = $response['auth_token']
  puts $token
  expect($response["auth_token"]).not_to be_nil
end
