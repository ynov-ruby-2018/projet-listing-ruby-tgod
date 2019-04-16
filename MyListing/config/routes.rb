Rails.application.routes.draw do
  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  localized do
    root to: "welcome#home"
    resources :listings
    resources :languages, only: :show
    resources :messages


    resources :account do
      get 'contacts', on: :collection
      get 'messages', on: :collection
      get 'user', on: :collection
    end

    namespace :api, format: 'json' do
      namespace :v1 do
        post 'auth', to: 'auth#create'
      end
    end

  end




end
