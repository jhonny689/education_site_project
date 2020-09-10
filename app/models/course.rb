class Course < ApplicationRecord
    belongs_to :admin, foreign_key: :user_id, class_name: :User
    has_many :teacher_courses
    has_many :teachers, through: :teacher_courses, class_name: :User
end
