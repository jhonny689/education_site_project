class TeacherCourse < ApplicationRecord
    belongs_to :teacher, foreign_key: :user_id, class_name: :User
    belongs_to :course

end
