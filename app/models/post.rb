class Post < ApplicationRecord
    belongs_to :timeline
    belongs_to :user
end
