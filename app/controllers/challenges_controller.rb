class ChallengesController < ApplicationController

    def create
        selected_prompts = Prompt.all.select { |prompt| prompt.length === (params[:length]).to_i }
        challenge = Challenge.create(uuid: params[:challenge_uuid], prompt_id: selected_prompts.sample.id)
        if challenge.valid?
            ActionCable.server.broadcast(challenge.uuid, {hi: true})
            render json: challenge, :include => [:prompt]
        else
            render json: {errors: challenge.errors.full_messages}
        end
    end

    def show
        challenge = Challenge.find_by(uuid: challenge_params[:id])
        render json: challenge, :include => [:prompt]
    end

    def update
        challenge = Challenge.find_by(uuid: params[:uuid])
        challenge.update(player_one_progress: params[:progress])
        ChallengesChannel.broadcast_to challenge, challenge
        render json: {hi: true}
    end

private 

def challenge_params
    params.permit(:challenge_uuid, :length, :id)
end

end
