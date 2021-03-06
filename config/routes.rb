Rails.application.routes.draw do
  get 'users/sign_in' => 'sessions#new'
  post 'users/sign_in' => 'sessions#create'
  get 'users/sign_up' => 'users#new'
  delete 'log_out' => 'sessions#destroy'
  resources :users
  resources :posts
  resources :categories
  root 'static_pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
