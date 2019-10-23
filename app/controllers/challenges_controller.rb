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
        challenge = Challenge.find_by(uuid: update_params[:id])
        if update_params[:progress]
            # byebug
            if challenge.player_one == update_params[:user_id].to_i
                # byebug
                challenge.update(player_one_progress: update_params[:progress])
            elsif challenge.player_two == update_params[:user_id].to_i
                challenge.update(player_two_progress: update_params[:progress])
            end
        end
        ChallengesChannel.broadcast_to challenge, challenge
        render json: {hi: true}
    end

    def subscribe
        challenge = Challenge.find_by(uuid: subscribe_params[:uuid])
        if subscribe_params[:user_id]
            if !challenge.player_one 
                challenge.update(player_one: subscribe_params[:user_id])
            elsif !challenge.player_two
                challenge.update(player_two: subscribe_params[:user_id])
            end
        end
        ChallengesChannel.broadcast_to challenge, challenge
        render json: challenge
    end

private 

def challenge_params
    params.permit(:challenge_uuid, :length, :id, :user_id, :uuid, :progress)
end

def subscribe_params
    params.permit(:uuid, :user_id)
end

def update_params
    params.permit(:progress, :user_id, :id)
end

end
