Quando("realizar a requisição para fazer signup na API") do
  $response = @signup.post_signup
  expect($response).to match_json_schema("signup")
end

Então("a API retorna o código de estado {int}") do |status_code|
  expect($response.code).to eq(status_code)
end

Então("a API retorna o token de acesso com a mensagem {string}") do |message|
  puts $response["auth_token"]
  puts $response["message"]
  expect($response["auth_token"]).not_to be_nil
  expect($response["message"]).to match(message)
end
