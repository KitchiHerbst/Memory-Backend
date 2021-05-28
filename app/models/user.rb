require "set"

class User < ApplicationRecord
    # associations
    has_many :timelines, dependent: :destroy
    has_many :posts, dependent: :destroy
    has_many :friendships, dependent: :destroy
    has_many :friends, through: :friendships

    # validations
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, presence: true, uniqueness: true
    has_secure_password

    # methods

    def manual_update(params)
        self.first_name = params[:first_name]
        self.last_name = params[:last_name]
        self.email = params[:email]
        self.profile_picture = params[:profile_picture]
        self.save
    end

    def all_users_except_self
        User.all.select {|u| u.id != self.id}
    end

    def not_friends
        users = self.all_users_except_self.to_set
        friends = self.friends.to_set
        array = users.difference(friends).to_a
    end

end
