class Api::V1::UsersController < ApplicationController

   def index
      user = User.find(decoded_token[0]['user_id'])
      users = User.all.select {|u| u.id != user.id}
      # users = User.all 
      render json: users
   end

    def create 
        # byebug

        user = User.create(first_name: params[:firstName], last_name: params[:lastName], email: params[:email],
         password: params[:password], profile_picture: params[:profilePicture] || nil) 
        # byebug
         if user
            render json: {token: JWT.encode({user_id: user.id}, 'Secret')}
         else
            render json: {error: 'Something went wrong'}
         end

    end

end
