class SessionsController < ApplicationController
    def new
        if session[:user_id]
            redirect_to root_path
        end
    end

    def create
        user = User.find_by_email(params[:email])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect_to root_url, notice: "Logged in!"
        else
            flash.now[:alert] = "Email ou password é invalido"
        render "new"
        end
    end

    def destroy
        session[:user_id] = nil
        redirect_to root_url, notice: "Logged out!"
        
    end
end