Rails.application.routes.draw do
  resources :portfolios

  get 'contact', to: 'pages#contact'
  get 'about-me', to: 'pages#about'

  resources :blogs

  root to: 'pages#home'
end
