Rails.application.routes.draw do
  root 'api/v1/welcome#index'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # API Endpoints
  api_version(module: 'api/v1', path: { value: 'api/v1' }, defaults: { format: :json }) do
    resources :users do
        collection do
            resources :sessions, only: [:create] do
                collection do
                  post :renew
                  post :invalidate_all
                end
            end
        end
        resources :rents, only: [:index, :create]
    end

    resources :books, only: [:index, :show]
    resources :book_suggestions, only: [:create]
  end
end
