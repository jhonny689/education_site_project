class CreateCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|
      t.integer :user_id
      t.string :name
      t.text :description
      t.string :course_type

      t.timestamps
    end
  end
end
