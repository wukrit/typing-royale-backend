class ChallengesController < ApplicationController

    def create
        selected_prompts = Prompt.all.select { |prompt| prompt.length === (params[:length]).to_i }
        challenge = Challenge.create(uuid: params[:challenge_uuid], prompt_id: selected_prompts.sample.id)
        if challenge.valid?
            render json: challenge, :include => [:prompt]
        else
            render json: {errors: challenge.errors.full_messages}
        end
    end


private 

def challenge_params
    params.permit(:challenge_uuid, :length)
end

end
