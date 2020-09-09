class GraduationPath < ApplicationRecord
    has_many :grad_programs
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
