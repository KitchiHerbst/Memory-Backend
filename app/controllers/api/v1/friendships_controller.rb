class Api::V1::FriendshipsController < ApplicationController

    def index
        byebug
        # we only need all of the friendships of the logged in user and then send back the users that they are friends with
        user = User.find_by(id: decoded_token[0]['user_id'])
        render json: user.friends
    end

    def create
        user = User.find_by(id: decoded_token[0]['user_id'])
        friend = User.find(params['_json'])
        friendship = Friendship.create_reciprocal_for_ids(user.id, friend.id)
    end

    def destroy
        # byebug
        
        Friendship.destroy_reciprocal_for_ids(decoded_token[0]['user_id'], params['_json'])
    end

end
