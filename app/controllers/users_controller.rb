class UsersController < ApplicationController
    
    def index
        @users = User.all
    end 

    def new
        @user = User.new
    end

    def create
        user = User.find_by(email: params[:email])
        if user 
            redirect_to user_path(user)
        else 
            user = User.create(user_params)
            session[:user_id] = user.id
            redirect_to user_path(user)
        end
    end

    def show
        if logged_in?
            @user = User.find(session[:user_id])
        else
            redirect_to log_in_path
        end 

    end

    private

    def user_params
        params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end


end