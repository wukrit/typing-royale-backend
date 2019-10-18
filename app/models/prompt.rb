class Prompt < ApplicationRecord
    has_many :challenges 
    has_many :users, through: :challenges 

    require 'rest-client'
    require 'json'

    def self.fetch(num_words)
        JSON.parse(RestClient.get "https://random-word-api.herokuapp.com/word?key=#{ENV['RANDOM_WORD_KEY']}&number=#{num_words}")
    end

end
