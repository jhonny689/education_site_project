class StudentGradCoursesController < ApplicationController
  def index
    @courses = Course.all.filter do |course|
      !current_user.enrolled_courses.include?(course)
    end
    enrolled = current_user.enrolled_per_type
    @remaining = current_user.remaining(enrolled)
  end
    

  def create
    sgc = StudentGradCourse.new
    sgc.student_grad_id = current_user.student_grad.id
    sgc.course_id = params[:course_id]
    sgc.status = "Enrolled"
    sgc.save
    redirect_to student_grad_courses_path
  end
end