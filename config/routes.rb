Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :tools
      post 'auth/login', to: 'authentication#authenticate'
      post 'signup', to: 'users#create'
    end
  end
end
