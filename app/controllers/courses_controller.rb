class CoursesController < ApplicationController
  before_action :find_course, only:[:show, :edit, :update, :destroy]

  def index
    @courses = Course.all
  end

  def show
  end

  def new
  end

  def create
    course = Course.create(course_params)
    if course.valid?
      redirect_to course_path(course)
    else
      flash[:errors] = course.errors.full_messages
      redirect_to new_course_path
    end
  end

  def edit
  end

  def update
    course = @course.create(course_params)
    if course.valid?
      redirect_to course_path(course)
    else
      flash[:errors] = course.errors.full_messages
      redirect_to edit_course_path
    end
  end

  def destroy
    @course.destroy
  end

  private

  def find_course
    @course = Course.find(params[:id])
  end

  def course_params
    params.require(:course).permit(:user_id, :name, :description, :course_type)
  end
end
