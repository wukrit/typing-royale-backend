class User < ApplicationRecord
    has_many :challenges
    has_many :prompts, through: :challenges
    has_secure_password

    validates :username, presence: true, uniqueness: true
    
end
