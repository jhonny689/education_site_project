class CreateGraduationPaths < ActiveRecord::Migration[6.0]
  def change
    create_table :graduation_paths do |t|
      t.string :title
      t.string :course_type
      t.integer :course_count
      t.integer :user_id

      t.timestamps
    end
  end
end
