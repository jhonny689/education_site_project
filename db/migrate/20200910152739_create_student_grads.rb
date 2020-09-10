class CreateStudentGrads < ActiveRecord::Migration[6.0]
  def change
    create_table :student_grads do |t|
      t.integer :user_id
      t.integer :graduation_path_id

      t.timestamps
    end
  end
end
