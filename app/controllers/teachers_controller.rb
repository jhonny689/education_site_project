class TeachersController < ApplicationController
  before_action :find_teacher, only: [:show, :edit, :update, :destroy]
  
  def index
    teacher_ids = TeacherCourse.all.map{|tc| tc.user_id}.uniq
    @teachers = User.where(user_id: teacher_ids)
  end

  def show
  end

  def new
    @teacher = TeacherCourse.new
  end

  def create
    teacher = TeacherCourse.create(teacher_params)
    if teacher.valid?
      redirect_to teacher_path(teacher)
    else
      flash[:errors] = teacher.errors.full_messages
      redirect_to new_teacher_path
    end
  end

  def edit
  end

  def update
    teacher = @teacher.update(teacher_params)
    if teacher.valid?
      redirect_to teacher_path(teacher)
    else
      flash[:errors] = teacher.errors.full_messages
      redirect_to edit_teacher_path
    end
  end

  def destroy
    @teacher.destroy
  end

  private 
  def find_teacher
    @teacher = TeacherCourse.find(params[:id])
end
