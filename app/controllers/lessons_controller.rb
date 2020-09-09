class LessonsController < ApplicationController
  def index
  end

  def show
    @lesson = Lesson.find(params[:id])
  end

  def new
    @lesson = Lesson.new
  end

  def create
    lesson = Lesson.create!(params.require(:lesson).permit(:test, :course_id))
    #byebug
    redirect_to lesson_path(lesson)
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
