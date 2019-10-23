class ChallengesChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    challenge = Challenge.find_by(uuid: params[:uuid])
    stream_for challenge
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
