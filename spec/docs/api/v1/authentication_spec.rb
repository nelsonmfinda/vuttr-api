module Docs
  module V1
    module Authentication
      extend Dox::DSL::Syntax

      show_params = {
        email: { type: :string, required: :required, value: "mariajoana@hotmail.com", description: "Email do usuário" },
        password: { type: :string, required: :required, value: "cec7052fcd3", description: "Senha do usuário" },
      }

      # define common resource data for each action
      document :api do
        resource "Autenticação" do
          endpoint "/auth/login"
          group "Autenticação"
          desc "auth.md"
        end
      end

      document :create do
        action "Autenticar um usuário" do
          path "/auth/login"
          verb "POST"
          params show_params
        end
      end
    end
  end
end
