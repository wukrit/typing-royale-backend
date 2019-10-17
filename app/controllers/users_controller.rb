class UsersController < ApplicationController

    def create
        @user = User.create(user_params)
        if user.valid?
            render json: authentication_json(user.id)
          else
            render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
        end 
    end

    def login
        @user = User.find_by(username: params[:username])
        @user.password = params[:password]
    end

    private
    
    def user_params
        params.require(:user).permit(
            :username,
            :password,
            :bio,
            :img_url,
        )
    end
    

    
end
