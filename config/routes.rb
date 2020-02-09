Rails.application.routes.draw do
  resources :chat_rooms, only: [:new, :create, :show, :index]
  resources :messages

  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register'}
  resources :portfolios, except: [:show]
  get 'angular-items', to: 'portfolios#angular'
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'

  post 'messages/:id', to: 'messages#create'

  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'


  resources :blogs do
    member do
      get :toggle_status
    end
  end

  root to: 'pages#home'
end

# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
