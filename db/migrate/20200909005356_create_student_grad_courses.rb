class CreateStudentGradCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :student_grad_courses do |t|
      t.integer :user_id
      t.integer :graduation_path_id
      t.integer :course_id
      t.string :status

      t.timestamps
    end
  end
end
