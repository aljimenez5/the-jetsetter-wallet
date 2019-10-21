class UsersController < ApplicationController
    before_action :require_login, only: [:show, :edit, :update, :destroy]


    def index
        @users = User.all
    end 

    def new
        if logged_in?
            redirect_to user_trips_path(current_user)
        else
            @user = User.new
        end
    end

    def create
        @user = User.find_by(email: params[:user][:email]) || User.find_by(username: params[:user][:username]) 
        if @user
            flash[:notice] = "User already in system."
            redirect_to log_in_path
        elsif params[:user][:password] != params[:user][:password_confirmation]
            flash[:notice] = "Password and Password Confirmation must match."
            redirect_to sign_up_path
        else
            user = User.create(user_params)
            session[:user_id] = user.id
            redirect_to user_trips_path(current_user)
        end
    end

    def show
        if logged_in?
            @user = current_user
        else
            redirect_to log_in_path
        end 

    end

    private

    def user_params
        params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end


end