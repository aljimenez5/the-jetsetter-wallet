class SessionsController < ApplicationController
    
    def new 
        @user = User.new
    end

    def create
        if params[:user][:password] == params[:user][:password_confirmation]
            @user = User.find_by(email: params[:user][:email]).try(:authenticate, (params[:user][:password]))
            if @user 
                session[:user_id] = @user.id 
                redirect_to user_path(@user)
            else
                flash[:notice] = "Incorrect name and/or password."
                redirect_to log_in_path
            end
        else
            flash[:notice] = "Password and Password Confirmation must match."
            redirect_to log_in_path
        end
    end

    def create_omniauth
        @user = User.find_or_create_by(uid: auth['uid']) do |u|
            u.username = auth['info']['name']
            u.email = auth['info']['email']
            u.uid = auth['uid']
        end

        session[:user_id] = @user.id

        render 'users/show'
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