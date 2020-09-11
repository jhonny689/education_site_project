class Lesson < ApplicationRecord
    belongs_to :course
    has_many :teachers, through: :course
    has_rich_text :test
    has_many :notes




    # def teacher
    #     self.course.teachers
    # end
end
