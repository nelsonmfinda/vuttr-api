module Docs
  module V1
    module Tools
      extend Dox::DSL::Syntax

      #show_params = { id: { type: :number, required: :required, value: 1, description: 'bid id' } }

      # define common resource data for each action
      document :api do
        resource 'Tools' do
          endpoint '/tools'
          group 'Tools'
          desc 'Get all registered tools'
        end
      end

      # define data for specific action
      document :index do
        action 'Get tools'
      end
    end
  end
end
