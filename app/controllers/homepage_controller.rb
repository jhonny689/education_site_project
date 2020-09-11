class HomepageController < ApplicationController
  def index
    redirect_to user_profile_path(current_user.user_profile)
  end
end
