Rails.application.routes.draw do
  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'
  
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'
  get 'portfolio/:id/edit', to: 'portfolios#edit', as: 'portfolio_edit'
  
  resources :portfolios, except: [:show, :edit]
  resources :blogs
  
  root to: 'pages#home'
end
