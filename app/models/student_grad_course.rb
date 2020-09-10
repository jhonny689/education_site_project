class StudentGradCourse < ApplicationRecord
    belongs_to :student_grad
    belongs_to :course
    
end
