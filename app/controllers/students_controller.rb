class StudentsController < ApplicationController
  before_action :find_student, only: [:show, :edit, :update, :destroy]

  def index
    student_ids = StudentGradCourse.all.map{|ugc| ugc.user_id}.uniq
    @students = User.where(id: student_ids)
  end

  def show
  end

  def new
  end

  def create
    student = StudentGradCourse.create(student_params)
    if student.valid?
      redirect_to student_path(student)
    else
      flash[:errrors] = student.errors.full_messages
      redirect_to new_student_path
    end
  end

  def edit
  end

  def update
    student = @student.update(student_params)
    if student.valid?
      redirect_to student_path(student)
    else
      flash[:errrors] = student.errors.full_messages
      redirect_to edit_student_path
    end
  end

  def destroy
    @student.destroy
  end

  private

  def find_student
    StudentGradCourse.find(params[:id])
  end

  def student_params
    params.require(:student_grad_course).permit(:user_id, :graduation_path_id, :course_id, :status)
  end
end
