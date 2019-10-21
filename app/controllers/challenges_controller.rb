class ChallengesController < ApplicationController

    def create
        render json: {challenge_id: params[:challenge_id]}
        # Challenge.new(user_id: user_id, prompt_id: Prompt.all.sample.id)
    end


private 

def challenge_params
    params.permit(:challenge_id, :length, :players, :user_id)
end

end
