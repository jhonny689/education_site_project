class StudentGrad < ApplicationRecord
    belongs_to :student, class_name: :User, foreign_key: :user_id
    belongs_to :graduation_path
    has_many :student_grad_courses
    has_many :courses, through: :student_grad_courses
end
