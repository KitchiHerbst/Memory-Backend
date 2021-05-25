class Api::V1::UsersController < ApplicationController

   def index
      user = User.find(decoded_token[0]['user_id'])
      users = User.all.select {|u| u.id != user.id}
      render json: users
   end

   def get_user
      user = User.find(decoded_token[0]['user_id'])
      render json: user
   end

   # def custom_user_path
   #    byebug
   # end

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
      user.first_name = params[:first_name]
      user.last_name = params[:last_name]
      user.email = params[:email]
      user.profile_picture = params[:profile_picture]
      user.save
      render json: user
    end

    def destroy
      user = User.find(params[:id])
      user.destroy
    end

end
