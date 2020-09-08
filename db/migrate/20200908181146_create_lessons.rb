class CreateLessons < ActiveRecord::Migration[6.0]
  def change
    create_table :lessons do |t|
      t.string 'title'
      t.integer :course_id
      t.binary :content

      t.timestamps
    end
  end
end
