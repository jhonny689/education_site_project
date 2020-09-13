class AddEmailColumnToUserProfiles < ActiveRecord::Migration[6.0]
  def change
    add_column :user_profiles, :email, :string
  end
end
