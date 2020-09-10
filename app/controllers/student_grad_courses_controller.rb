class StudentGradCoursesController < ApplicationController
  def index
    byebug
    @courses = Course.all.filter do |course| 
      byebug
      !current_user.enrolled_courses.include?(course)
    end
  end

  def create
  end
end