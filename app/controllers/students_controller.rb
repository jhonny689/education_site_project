class StudentsController < ApplicationController
  before_action :find_student, only: [:show, :edit, :update, :destroy]

  def index
    student_ids = UserGradCourse.all.map{|ugc| ugc.user_id}.uniq
    @students = User.where(id: teacher_ids)
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
