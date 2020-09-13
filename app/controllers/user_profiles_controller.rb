class UserProfilesController < ApplicationController
  before_action :find_user_profile, only: [:show, :edit, :update, :destroy]
  skip_before_action :user_profile_exist?
  def index
    @user_profiles = UserProfile.all.filter {|u|
      !u.user.isAdmin?
    }
    
    if params[:lookup] && params[:lookup][:name] != ''
      @user_profiles = @user_profiles.filter{|u| u.user.full_name.downcase.include? params[:lookup][:name].downcase}
    end
    
    if params[:lookup] && params[:lookup][:type] != ''
      @user_profiles = @user_profiles.filter{|u| u.user.type.to_s == params[:lookup][:type]} 
    end
  
    @types = [:student, :teacher, :unassigned]
  end

  def show
    
  end

  def new
    @user_profile = UserProfile.new
  end

  def create
    if params[:signout]
      sign_out(current_user)
      redirect_to root_path
    else
      user_profile = UserProfile.new(user_profile_params)
      user_profile.user_id = current_user.id
      
      if current_user.email.include?("@fake.com")
        current_user.update(email: user_profile.email)
      end
    
      if user_profile.valid?
        user_profile.save
      
        redirect_to user_profile_path(user_profile)
      else
      
        flash[:errors] = user_profile.errors.full_messages
        redirect_to new_user_profile_path
      end
    end
  end

  def edit
  end

  def update
    user_profile = @user_profile.update(user_profile_params)
    if user_profile.valid?
      redirect_to user_profile_path(user_profile)
    else
      flash[:errors] = user_profile.errors.full_messages
      redirect_to edit_user_profile_path
    end
  end

  def destroy
    #@user_profile.destroy
    sign_out current_user
  end

  private
  def find_user_profile
    @user_profile = UserProfile.find(params[:id])
  end

  def user_profile_params
    params.require(:user_profile).permit(:f_name, :m_name, :l_name, :phone_number, :email, :is_admin)
  end
end
