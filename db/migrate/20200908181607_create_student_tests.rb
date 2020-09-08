class CreateStudentTests < ActiveRecord::Migration[6.0]
  def change
    create_table :student_tests do |t|
      t.integer :user_grad_course_id
      t.integer :test_id
      t.integer :grade
      t.text :feedback

      t.timestamps
    end
  end
end
