class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
    def facebook
      
        @user = User.from_omniauth(omniauth_params)
        byebug

    end

    def google_oauth2
        byebug
        @user  = User.from_omniauth(omniauth_params)
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