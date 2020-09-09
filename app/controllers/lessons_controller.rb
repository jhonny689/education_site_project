class LessonsController < ApplicationController
  before_action :find_lesson, only: [:show, :edit, :update, :destroy]

  def index
    @lessons = Lesson.all
  end

  def show
    @lesson = Lesson.find(params[:id])
  end

  def new
    @lesson = Lesson.new
  end

  def create 
    #byebug
    lesson = Lesson.create(lesson_params)
    if lesson.valid?
      redirect_to lesson_path(lesson)
    else
      flash[:errors] = lesson.errors.full_messages
      redirect_to new_lesson_path
    end
    # lesson = Lesson.create!(params.require(:lesson).permit(:test, :course_id))
    # #byebug
    # redirect_to lesson_path(lesson)
  end

  def edit
  end

  def update
    lesson = @lesson.update(lesson_params)
    if lesson.valid?
      redirect_to lesson_path(lesson)
    else
      flash[:errors] = lesson.errors.full_messages
      redirect_to edit_lesson_path
    end
  end

  def destroy
    @lesson.destroy
  end

  private

  def find_lesson
    @lesson = Lesson.find(params[:id])
  end

  def lesson_params
    params.require(:lesson).permit(:title, :course_id, :content, :test)
  end
end
