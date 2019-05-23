module Docs
  module V1
    module Users
      extend Dox::DSL::Syntax

      #show_params = { id: { type: :number, required: :required, value: 1, description: 'bid id' } }

      # define common resource data for each action
      document :api do
        resource 'Users' do
          endpoint '/users'
          group 'Users'
          desc 'Get all registered users'
        end
      end

      # define data for specific action
      document :index do
        action 'Get tools'
      end

      document :show do
        action "Get a tool"
      end

      document :update do
        action "Update a tool"
      end

      document :create do
        action "Create a tool"
      end

      document :destroy do
        action "Delete a tool"
      end
    end
  end
end
