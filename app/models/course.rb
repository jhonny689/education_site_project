class Course < ApplicationRecord
    belongs_to :admin, foreign_key: :user_id, class_name: :User
    has_many :teacher_courses
    has_many :teachers, through: :teacher_courses, class_name: :User
    has_many :lessons
    has_many :student_grad_courses
    has_many :student_grads, through: :student_grad_courses, source: :student_grad
    has_many :students, through: :student_grads, class_name: :User, source: :student
end
