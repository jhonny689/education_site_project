class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
    def facebook
      
        @user = User.from_omniauth(omniauth_params)
        byebug

    end

    def google_oauth2
        
        @user  = User.from_omniauth(omniauth_params)
        sign_in(@user)
        byebug
        if @user.user_profile
            redirect_to user_profile_path(@user)
        end
        redirect_to new_user_profile_path
        byebug
    end

    def failure
        redirect_to :root
    end

    private

    def omniauth_params
        request.env["omniauth.auth"]
    end

end