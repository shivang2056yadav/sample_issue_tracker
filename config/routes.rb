Rails.application.routes.draw do
  resources :issues
  devise_for :users
  root 'static_pages#home'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  get '/users', to: 'users#index'

end
