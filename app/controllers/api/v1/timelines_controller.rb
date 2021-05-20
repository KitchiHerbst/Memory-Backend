class Api::V1::TimelinesController < ApplicationController

    def create
        user = User.find_by(id: decoded_token[0]['user_id'])
        timeline = Timeline.create(user_id: user.id, name: "#{user.first_name}s Timeline", access: 'GLOBAL')
    end

    def user_timeline
        user = User.find_by(id: decoded_token[0]['user_id'])
        timeline = user.timelines.first
        render json: timeline
    end

end
