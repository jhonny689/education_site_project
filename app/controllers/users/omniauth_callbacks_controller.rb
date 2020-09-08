class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
    def facebook
      
        @user = User.from_omniauth(omniauth_params)
        byebug

    end

    def google_oauth2
        user  = User.from_test_auth(test_params)

        if user.present?
            sign_out_all_scopes
            sign_in(user)
            redirect_to user_path(current_user)
        else
            flash[:alert] = t 'devise.omniauth_callbacks.failure', kind: 'Google', reason: "#{auth.info.email} is not authorized."
            redirect_to root_path
        end
    end

    def failure
        redirect_to :root
    end

    private

    def omniauth_params
        request.env["omniauth.auth"]
    end

    def test_params
        @test_params ||= { email: auth.info.email }
    end

    def auth
        @auth ||= request.env['omniauth.auth']
    end

end