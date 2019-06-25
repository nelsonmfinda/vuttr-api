Dado("que o usuário esteja logado na API") do
  puts $response = @login.post_login
  expect($response).to match_json_schema("login")
  $token = $response["auth_token"]
  @tool = Tool.new(@body, $token)
end

Dado("o endpoint da API para cadastrar uma Ferramenta") do
  # Já instanciado pela classe Tool
end

Quando("realizar uma requisição para cadastrar uma Ferramenta") do
  $response = @tool.post_tool
end

Então("a API irá retornar os dados do cadastro da Ferramenta") do
  expect(JSON.parse($response.body)).to include("id", "title", "link", "description", "tags", "created_by")
  puts $response.body
  $id = $response["id"]
  $tag = $response["tags"].sample(1)
  expect($response.body).to match_json_schema("tool")
end

Então("respondendo com o código {int}") do |status_code|
  expect($response.code).to eq(status_code)
end

Quando("realizar a requisição para consultar uma ferramenta por id") do
  puts "ID: #{$id}"
  $response = @tool.get_tool($id)
end

Dado("que a API retorna o código {int}") do |status_code|
  expect($response.code).to eq(status_code)
end

Então("o corpo da resposta terá os dados da ferramenta") do
  expect(JSON.parse($response.body)).to include("id", "title", "link", "description", "tags", "created_by")
end

Quando("realizar a requisição para apagar a ferramenta") do
  $response = @tool.delete_tool($id)
end

Então("a API retorna o código {int}") do |status_code|
  expect($response.code).to eq(status_code)
end

Quando("realizar a requisição para consultar uma Ferramenta por tag") do
  $response = @tool.find_by_tag($tag)
end

Dado("que a API retorna o código de estado {int}") do |status_code|
  expect($response.code).to eq(status_code)
end

Então("o corpo da resposta terá os dados da ferramenta contendo a tag consultada") do
  expect(JSON.parse($response.body)).to include("id", "title", "link", "description", "tags", "created_by")
  expect($response["tags"]).to include($tag)
end
