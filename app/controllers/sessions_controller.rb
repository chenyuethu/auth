class SessionsController < ApplicationController
    def new
    end

    def create
        # Step 1: Check if there is a user with the email that was provided
        @user = User.find_by({"email" => params["email"] })
        if @user 
        # Step 1a: If yes, check passpowrd.
        # Step 2: Check the password to see if it matches
            if params["email"] == @user["password"]
        # Step 2a: If yes, go to comapny page.
                redirect_to "/companies" 
            else
                redirect_to "/sessions/new" 
            end
        # Step 2b: If no, go back to login page
        else 
        # Step 1b: If no, go back to login page
        redirect_to "/sessions/new" 

        end
    end
end
