class Course < ApplicationRecord
    belongs_to :admin, foreign_key: :user_id, class_name: :User
    has_one :teacher_course
    has_one :teacher, through: :teacher_course, foreign_key: :user_id
end
