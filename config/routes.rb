Rails.application.routes.draw do

  post '/posts:user_id:post_id', to: 'posts#like', as: 'like_post'

  devise_for :users, controllers: { registrations: 'registrations' }
  resources :posts

  root to: 'posts#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
