class UsersController < ApplicationController

    def create
        user = User.create(user_params)
        if user.valid?
            render json: authentication_json(user.id)
        else
            render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
        end 
    end

    def login
        user = User.find_by(username: params[:username])
        user.password = params[:password]
    end

    def show
        user_id = params[:id]
        if logged_in_user_id == user_id.to_i
            user = User.find(params[:id])
            render json: user
        else
            render json: { go_away: true }, status: :unauthorized
        end
    end

    def update
        user_id = params[:user_id]
        if logged_in_user_id == user_id.to_i
            user = User.find(params[:id])
            user.update(bio: params[:bio])
            render json: {bio: user.bio}
        else
            render json: { go_away: true }, status: :unauthorized
        end
    end

    private
    
    def user_params
        params.permit(:username, :password, :bio, :img_url)
    end
    
end
