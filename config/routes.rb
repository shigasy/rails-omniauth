Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      get 'test', to: 'test#test'
      devise_for :users, controllers: {omniauth_callbacks: 'users/omniauth_callbacks'}
    end
  end
  get 'test', to: 'test#test'
  root 'test#test2'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
