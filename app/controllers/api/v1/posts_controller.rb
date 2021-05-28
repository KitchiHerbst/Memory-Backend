class Api::V1::PostsController < ApplicationController

    def create
        # byebug
        post = Post.create(timeline_id: params[:timelineId], user_id: decoded_token[0]['user_id'],
         picture: params[:picture], text: params[:text], date: params[:date], location: params[:location])

    end

end
