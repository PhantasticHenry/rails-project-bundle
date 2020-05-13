class SessionsController < ApplicationController 
    def new
        @user = User.new
    end

    def create 
        @user = User.find_by(email: params[:user][:email])
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id 
            redirect_to root_path
        else
            redirect_to login_path, alert: "User not found. Please try again."
        end
    end
end