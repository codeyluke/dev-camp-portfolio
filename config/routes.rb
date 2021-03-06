Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'signup' }
  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'
  
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'
  get 'portfolio/:id/edit', to: 'portfolios#edit', as: 'portfolio_edit'
  get 'portfolios/ruby_on_rails', to: 'portfolios#ruby_on_rails', as: 'portfolios_ruby_on_rails'
  get 'portfolios/react', to: 'portfolios#react', as: 'portfolios_react'


  resources :portfolios, except: [:show, :edit] do
    put :sort, on: :collection
  end
  resources :blogs do
    member do 
      get :toggle_status
    end
  end
  
  mount ActionCable.server => '/cable'
  root to: 'pages#home'
end
