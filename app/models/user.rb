class User < ApplicationRecord
    # associations
    has_many :timelines
    has_many :posts

    # validations
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, presence: true, uniqueness: true
    has_secure_password

    # methods


end
