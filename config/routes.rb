Rails.application.routes.draw do



  namespace :api do
    namespace :v1 do
      resources :friendships, except: :delete
      
      resources :posts
      resources :timelines
      resources :users  

      # get '/users/:first_name', to: 'users#custom_user_path'

      get '/get_user', to: 'users#get_user'
      post '/login', to: 'auth#login'
      get '/user_timeline', to: 'timelines#user_timeline'
      get '/friend_timeline/:friend_id', to: 'timelines#friend_timeline'
      get '/timeline_posts', to: 'posts#timeline_posts'
      delete "/friendships", to: "friendships#destroy"
    end
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
