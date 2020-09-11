class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
    def facebook
      
        @user = User.from_omniauth(omniauth_params)


    end

    def google_oauth2
        
        @user  = User.from_omniauth(omniauth_params)
        sign_in(@user)

        if @user.user_profile
            redirect_to user_profile_path(@user)
        else
            redirect_to new_user_profile_path
        end
    end
    def github
        
        @user  = User.from_omniauth(omniauth_params)
        sign_in(@user)

        if @user.user_profile
            redirect_to user_profile_path(@user)
        else
            redirect_to new_user_profile_path
        end
    end

    def failure
        redirect_to :root
    end

    private

    def omniauth_params
        request.env["omniauth.auth"]
    end

end