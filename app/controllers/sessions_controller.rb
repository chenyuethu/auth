class SessionsController < ApplicationController
    def new
    end

    def create
        # Step 1: Check if there is a user with the email that was provided
        @user = User.find_by({"email" => params["email"] })
        if @user 
        # Step 1a: If yes, check passpowrd.
        # Step 2: Check the password to see if it matches
            if BCrypt::Password.new(@user["password"]) == params["password"]
        # Step 2a: If yes, go to comapny page.
                session["user_id"] = @user["id"]
                flash["notice"] = "You are in!"
                redirect_to "/companies" 
            else
                flash["notice"] = "Wrong Credentials"
                redirect_to "/sessions/new" 
            end
        # Step 2b: If no, go back to login page
        else 
        flash["notice"] = "Wrong Credentials"
        redirect_to "/sessions/new" 
        end
    end

    def destroy
        flash["see you later!"]
        session["user_id"] = nil
        redirect_to "sessions/new"
    end
end
