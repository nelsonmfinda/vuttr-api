module Docs
  module V1
    module Users
      extend Dox::DSL::Syntax

      show_params = {
        name: { type: :string, required: :required, value: "Maria Joana", description: "Nome do usuário" },
        email: { type: :string, required: :required, value: "mariajoana@hotmail.com", description: "Email do usuário" },
        password: { type: :string, required: :required, value: "cec7052fcd3", description: "Senha do usuário" },
        password_confirmation: { type: :string, required: :required, value: "cec7052fcd3", description: "Confirmação da senha do usuário" }
      }

      # define common resource data for each action
      document :api do
        resource "Usuários" do
          endpoint "/signup"
          group "Usuários"
          desc "users.md"
        end
      end

      document :create do
        action "Cadastrar um novo usuário" do
          path "/signup"
          verb "POST"
          params show_params
        end
      end
    end
  end
end
