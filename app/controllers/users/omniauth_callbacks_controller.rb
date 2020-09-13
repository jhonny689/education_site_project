class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
    def facebook
        @user = User.from_omniauth(omniauth_params)
        byebug
        if @user
            sign_in(@user)
            if @user.user_profile
                redirect_to user_profile_path(@user.user_profile)
            else
                redirect_to new_user_profile_path
            end
        else
            flash[:errors_o] = "This email exists through a different omniauth provider, please log in with the proper provider"
            redirect_to new_user_session_path
        end

    end

    def google_oauth2
        
        @user  = User.from_omniauth(omniauth_params)
        if @user
            sign_in(@user)
            if @user.user_profile
                redirect_to user_profile_path(@user.user_profile)
            else
                redirect_to new_user_profile_path
            end
        else
            flash[:errors_o] = "This email exists through a different omniauth provider, please log in with the proper provider"
            redirect_to new_user_session_path
        end
    end
    def github
        
        @user  = User.from_omniauth(omniauth_params)
        if @user
            sign_in(@user)

            if @user.user_profile
                redirect_to user_profile_path(@user.user_profile)
            else
                redirect_to new_user_profile_path
            end
        else
            flash[:errors_o] = "This email exists through a different omniauth provider, please log in with the proper provider"
            redirect_to new_user_session_path
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