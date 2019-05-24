module Docs
  module V1
    module Tools
      extend Dox::DSL::Syntax

      show_params = {
        title: { type: :string, required: :required, value: 'quod', description: 'Nome da ferramenta' },
        link: { type: :string, required: :required, value: 'http://sauer.name/angela', description: 'Link da ferramenta' },
        description: { type: :string, required: :required, value: 'Modi sit consequatur', description: 'Descrição da ferramenta' },
        tags: { type: :array, required: :required, value: ['node', 'web'], description: 'Tags da ferramenta' }
      }

      tag_param = { tags: { type: :string, required: :required, value: 'node', description: 'Tag a ser filtrada' } }

      id_param = { id: { type: :number, required: :required, value: 10, description: 'Id da ferramenta' } }

      # define common resource data for each action
      document :api do
        resource 'Ferramentas' do
          endpoint '/tools'
          group 'Ferramentas'
          desc 'tools.md'
        end
      end

      # define data for specific action
      document :index do
        action 'Listar todas ferramentas cadastradas'
      end

      document :show do
        action "Listar uma ferramenta por ID" do
          path '/tools/{id}'
          verb 'GET'
          params id_param
        end
      end

      document :search do
        action "Filtrar ferramentas utilizando uma busca por tag" do
          path '/tools/?tag={tag}'
          verb 'GET'
          params tag_param
        end
      end

      document :update do
        action "Editar uma ferramenta" do
          path '/tools/{id}'
          verb 'PUT'
          params show_params
        end
      end

      document :create do
        action "Cadastrar uma nova ferramenta" do
          path '/tools'
          verb 'POST'
          params show_params
        end
      end

      document :destroy do
        action "Apagar uma ferramenta por ID" do
          path '/tools/{id}'
          verb 'DELETE'
          params id_param
        end
      end
    end
  end
end
