class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    before_action :user_profile_exist?

    def user_profile_exist?
        if current_user && !current_user.user_profile
            redirect_to new_user_profile_path
        end  
    end
end
