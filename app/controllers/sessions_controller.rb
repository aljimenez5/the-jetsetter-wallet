class SessionsController < ApplicationController
    
    def index

    end
    
    def new
        if logged_in?
            redirect_to user_trips_path(current_user)
        else
            @user = User.new
        end
    end

    def create
        @user = User.find_by(email: params[:user][:email]).try(:authenticate, (params[:user][:password]))
        if @user 
            session[:user_id] = @user.id 
            redirect_to user_path(@user)
        else
            flash[:notice] = "Incorrect email and/or password."
            redirect_to log_in_path
        end
    end

    def create_omniauth
        @user = User.find_or_create_by(uid: auth['uid']) do |u|
            u.username = auth['info']['name']
            u.email = auth['info']['email']
            u.password = SecureRandom.hex
            u.uid = auth['uid']

        end

        session[:user_id] = @user.id

        redirect_to user_trips_path(current_user)

    end


    def destroy
        session.delete :user_id
        redirect_to root_path
    end

    private

    def auth
        request.env['omniauth.auth']
    end
    

end