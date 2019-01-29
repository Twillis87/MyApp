Rails.application.routes.draw do
  namespace :admin do
      resources :users
      resources :blogs
      resources :portfolios
      resources :skills
      resources :technologies
      resources :topics
      resources :guest_users

      root to: "users#index"
    end
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register'}
  resources :portfolios, except: [:show]
  get 'angular-items', to: 'portfolios#angular'
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'
  
  get 'about-me', to: 'pages#about'
  get 'contact', to: 'pages#contact'
  

  resources :blogs do
  	member do
  		get :toggle_status
  	end
  end
 
 root to: 'pages#home'
end
