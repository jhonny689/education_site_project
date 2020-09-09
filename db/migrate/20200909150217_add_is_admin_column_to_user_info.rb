class AddIsAdminColumnToUserInfo < ActiveRecord::Migration[6.0]
  def change
    add_column :user_profiles, :is_admin, :boolean
  end
end
