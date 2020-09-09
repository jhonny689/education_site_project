class DeleteCourseTypeAndCountFromGraduationPaths < ActiveRecord::Migration[6.0]
  def change
    remove_column :graduation_paths, :course_type
    remove_column :graduation_paths, :course_count
  end
end
