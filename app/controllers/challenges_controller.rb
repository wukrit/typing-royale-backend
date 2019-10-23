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
        user = User.find(update_params[:user_id])
        if update_params[:progress]
            if challenge.player_one == user.username
                challenge.update(player_one_progress: update_params[:progress])
            elsif challenge.player_two == user.username
                challenge.update(player_two_progress: update_params[:progress])
            end
        end
        ChallengesChannel.broadcast_to challenge, challenge
    end

    def subscribe
        challenge = Challenge.find_by(uuid: subscribe_params[:uuid])
        if subscribe_params[:user_id]
            if !challenge.player_one 
                player_one = User.find(subscribe_params[:user_id])
                challenge.update(player_one: player_one.username)
            elsif !challenge.player_two
                player_two = User.find(subscribe_params[:user_id])
                challenge.update(player_two: player_two.username)
            end
        end

        ChallengesChannel.broadcast_to challenge, challenge
    end

    def results
        challenge = Challenge.find_by(uuid: result_params[:uuid])
        user = User.find(result_params[:user_id])
        if !challenge.winner_id
            challenge.winner_id = user.id
            challenge.winner_name = user.username
        end
        UserChallenge.create(user_id: user.id, challenge_id: challenge.id, wpm: result_params[:wpm].to_f)
        if challenge.player_one == user.username
            challenge.player_one_wpm = result_params[:wpm].to_f
        elsif challenge.player_two === user.username
            challenge.player_two_wpm =  result_params[:wpm].to_f
        end

        challenge.save
        ChallengesChannel.broadcast_to challenge, challenge
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

    def result_params
        params.permit(:wpm, :user_id, :uuid)
    end

end
