class GraduationPathsController < ApplicationController
  before_action :find_path, only: [:show, :edit, :update, :destroy]

  def index
    @graduation_paths = GraduationPath.all
  end

  def show
  end

  def new
  end

  def create
    path = GraduationPath.create(path_params)
    if path.valid?
      redirect_to graduation_path_path(path)
    else
      flash[:errors] = path.errors.full_messages
      redirect_to new_graduation_path_path
    end
  end

  def edit
  end

  def update
    path = @path.create(path_params)
    if path.valid?
      redirect_to graduation_path_path(path)
    else
      flash[:errors] = path.errors.full_messages
      redirect_to edit_graduation_path_path
    end
  end

  def destroy
    @path.destroy
  end

  private

  def find_path
    @path = GraduationPath.find(params[:id])
  end

  def path_params
    params.require(:graduation_path).permit(:title, :course_type, :course_count, :user_id)
end
