class EditSgcRmUserIdRmGradPathIdAddStudentGradId < ActiveRecord::Migration[6.0]
  def change
    remove_column :student_grad_courses, :user_id
    remove_column :student_grad_courses, :graduation_path_id
  end
end
