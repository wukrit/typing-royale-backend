class User < ApplicationRecord
    has_many :challenges
    has_many :prompts, through: :challenges
end
