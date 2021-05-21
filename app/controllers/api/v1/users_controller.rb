class Api::V1::UsersController < ApplicationController

   def index
      user = User.find(decoded_token[0]['user_id'])
      users = User.all.select {|u| u.id != user.id}
      # users = User.all 
      render json: users
   end

   def get_user
      user = User.find(decoded_token[0]['user_id'])
      render json: user
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

    def update
      user = User.find(decoded_token[0]['user_id'])
      user.update_attributes(first_name => params[:first_name], last_name => params[:last_name], email => params[:email], profile_picture => params[:profile_picture])
      byebug
    end

end
