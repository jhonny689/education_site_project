class TeachersController < ApplicationController
  before_action :find_teacher, only: [:show, :edit, :update, :destroy]
  
  def index
    teacher_ids = TeacherCourse.all.map{|tc| tc.user_id}.uniq
    @teachers = User.where(id: teacher_ids)
  end

  def show
  end

  def new
    @teacher = TeacherCourse.new
    @courses = current_user.created_courses
    @course_id = params[:course_id] ? params[:course_id] : nil
    @teachers = User.all.filter {|user| !user.isAdmin? && !user.isStudent? }

    
  end

  def create
    tc = TeacherCourse.new(teacher_params)
    tc.admin_id = current_user.id
    if tc.valid?
      tc.save
      redirect_to courses_path
    else
      flash[:errors] = tc.errors.full_messages
      redirect_to new_teacher_course_path
    end
  end

  def edit
  end

  def update
    teacher = @teacher.update(teacher_params)
    if teacher.valid?
      redirect_to teacher_course_path(teacher)
    else
      flash[:errors] = teacher.errors.full_messages
      redirect_to edit_teacher_course_path
    end
  end

  def destroy
    @teacher.destroy
  end

  private 
  def find_teacher
    @teacher = TeacherCourse.find(params[:id])
  end

  def teacher_params
    params.require(:teacher_course).permit(:admin_id, :user_id, :course_id)
  end
end
