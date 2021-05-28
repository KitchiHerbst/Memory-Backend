class Api::V1::UsersController < ApplicationController

   def index
      # byebug
      user = User.find(decoded_token[0]['user_id'])
      users = user.all_users_except_self
      render json: users
   end

   def get_user
      user = User.find(decoded_token[0]['user_id'])
      render json: user
   end

    def create 
      user = User.create(first_name: params[:firstName], last_name: params[:lastName], email: params[:email],
             password: params[:password], profile_picture: params[:profilePicture] || nil) 
      if user
         render json: {token: JWT.encode({user_id: user.id}, 'Secret')}
      else
         render json: {error: 'Something went wrong'}
      end

    end

    def update
      user = User.find(decoded_token[0]['user_id'])
      user.manual_update(params)
      render json: user
    end

    def destroy
      user = User.find(params[:id])
      user.destroy
    end

end
