Rails.application.routes.draw do

  post '/posts:user_id:post_id', to: 'posts#like', as: 'like_post'

  devise_for :users, controllers: { registrations: 'registrations', sessions: 'sessions' }

  devise_scope :user do 
    post '/sessions/friend/:user_id', to: 'sessions#acceptrequest', as: 'friend_request'
    delete '/sessions/friend/:user_id', to: 'sessions#removefriend', as: 'friend_delete'
    post '/sessions/request/:user_id', to: 'sessions#sendrequest', as: 'send_friend_request'
  end

  # devise_scope :sessions do
    
  # end

  resources :posts

  root to: 'posts#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
