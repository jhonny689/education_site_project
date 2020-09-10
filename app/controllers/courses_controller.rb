class CoursesController < ApplicationController
  before_action :find_course, only:[:show, :edit, :update, :destroy]

  def index
    case current_user.type
    when :admin
      @courses = current_user.created_courses
    when :student
      @courses = current_user.enrolled_courses
    when :teacher
      @courses = current_user.teacher_courses
    else
      @courses = Courses.all
    end
  end

  def show
  end

  def new
    @course = Course.new
    @course_types = GraduationPath::COURSE_TYPES
    @course_types.unshift("")
  end

  def create
   
    course = Course.new(course_params)
    course.user_id = current_user.id
    if course.valid?
      course.save
      redirect_to course_path(course)
    else
      flash[:errors] = course.errors.full_messages
      redirect_to new_course_path
    end
  end

  def edit
    @course_types = GraduationPath::COURSE_TYPES
    @course_types.unshift("")
  end

  def update
    @course.update(course_params)
    if @course.valid?
      redirect_to course_path(@course)
    else
      flash[:errors] = @course.errors.full_messages
      redirect_to edit_course_path
    end
  end

  def destroy
    @course.destroy
    redirect_to courses_path
  end

  private

  def find_course
    @course = Course.find(params[:id])
  end

  def course_params
    params.require(:course).permit(:user_id, :name, :description, :course_type)
  end
end
