class GraduationPath < ApplicationRecord
    has_many :grad_programs
    has_many :student_grads
    belongs_to :user

    accepts_nested_attributes_for :grad_programs

    COURSE_TYPES = [
        'Sciences',
        'Languages',
        'Social Studies',
        'Economics',
        'Arts',
        'Physical Education'
    ]
end
# SELECT "courses".* 
# FROM "courses" 

# INNER JOIN "student_grads" ON "graduation_paths"."id" = "student_grads"."graduation_path_id" WHERE "student_grads"."user_id" = ? LIMIT ?  [["user_id", 10], ["LIMIT", 11]]