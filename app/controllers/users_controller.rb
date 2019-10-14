class UsersController < ApplicationController
    before_action :require_login, only: [:show, :edit, :update, :destroy]


    def index
        @users = User.all
    end 

    def new
        @user = User.new
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
            binding.pry
            user = User.create(user_params)
            session[:user_id] = user.id
            redirect_to user_path(current_user)
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

    def require_login
        unless logged_in?
        flash[:notice] = "You need to be signed in to access this page."
        redirect_to root_path
        end
    end

end