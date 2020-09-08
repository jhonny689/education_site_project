class CreateUserProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :user_profiles do |t|
      t.string :f_name
      t.string :m_name
      t.string :l_name
      t.string :phone_number
      t.integer :user_id

      t.timestamps
    end
  end
end
