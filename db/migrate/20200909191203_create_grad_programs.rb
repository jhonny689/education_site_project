class CreateGradPrograms < ActiveRecord::Migration[6.0]
  def change
    create_table :grad_programs do |t|
      t.string :course_type
      t.integer :course_count
      t.integer :graduation_path_id

      t.timestamps
    end
  end
end
