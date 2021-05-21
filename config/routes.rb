Rails.application.routes.draw do



  namespace :api do
    namespace :v1 do
      resources :friendships
      
      resources :posts
      resources :timelines
      resources :users

      post '/login', to: 'auth#login'
      get '/user_timeline', to: 'timelines#user_timeline'
    end
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
