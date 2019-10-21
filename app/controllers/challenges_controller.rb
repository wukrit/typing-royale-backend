class ChallengesController < ApplicationController

    def create
        # render json: {challenge_id: params[:challenge_id]}
        challenge = Challenge.create(id: params[:challenge_id], user_id: params[:user_id], prompt_id: Prompt.all.sample.id)
        if challenge.valid?
            render json: challenge
        else
            render json: {errors: challenge.errors.full_messages}
        end
    end


private 

def challenge_params
    params.permit(:challenge_id, :length, :players, :user_id)
end

end
