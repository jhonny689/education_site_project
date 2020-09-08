class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :omniauthable, omniauth_providers: [:facebook, :google_oauth2, :twitter, :github] #,validatable

  def self.from_omniauth(auth)
    byebug
    where(provider: auth.provider, uid: auth.uid).find_or_create_by do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      # user.name = auth.info.name
      # user.image = auth.info.image
    end
  end

  def self.from_test_auth(email:)
    find_or_create_by!(email: email)
  end


  def after_sign_out_path_for(_resource_or_scope)
    root_path
  end

  def after_sign_in_path_for(resource_or_scope)
    #insert path here
  end
end
