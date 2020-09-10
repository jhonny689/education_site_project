class AddStudentGradIdToSgc < ActiveRecord::Migration[6.0]
  def change
    add_column :student_grad_courses, :student_grad_id, :integer
  end
end
