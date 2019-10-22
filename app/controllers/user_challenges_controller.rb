class UserChallengesController < ApplicationController

    def create
        user_challenge = UserChallenge.create(
            user_id: params[:user_id],
            challenge_id: params[:challenge_id],
            wpm: params[:wpm]
        )
        if user_challenge.valid?
            render json: user_challenge
        else 
            render json: {errors: user_challenge.errors.full_messages}
        end

    end

    private 
    
    def challenge_params
        params.permit(:user_id, :wpm, :challenge_id)
    end
    
end
