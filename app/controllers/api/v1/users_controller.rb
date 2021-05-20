class Api::V1::UsersController < ApplicationController

    def create 
        # byebug

        user = User.create(first_name: params[:firstName], last_name: params[:lastName], email: params[:email],
         password: params[:password], profile_picture: params[:profilePicture] || nil) 
        # byebug
         if user
            render json: user
         else
            render json: {error: 'Something went wrong'}
         end

    end

end
