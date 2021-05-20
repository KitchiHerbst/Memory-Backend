class Api::V1::AuthController < ApplicationController

    def login
        #use params to search for a user
        # byebug 
        # if username and password matches then log that user in
        # send back a token

        # byebug

        user = User.find_by(email: auth_params[:email])
        if user && user.authenticate(auth_params[:password])
            render json: {token: JWT.encode({user_id: user.id}, 'Secret')}
        # else
        #     render json: {error: 'Incorrect username or password'}
        end
    end

    def auth_params
        params.require(:auth).permit(:email, :password)
    end
end
