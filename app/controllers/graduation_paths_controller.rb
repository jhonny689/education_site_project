class GraduationPathsController < ApplicationController
  before_action :find_path, only: [:show, :edit, :update, :destroy]

  def index
    case current_user.type
    when :admin
      @graduation_paths = current_user.programs
    when :student
      @graduation_paths = current_user.graduation_path
    else
      @graduation_paths = Graduation_path.all
    end
  end

  def show
    
  end

  def new
    @graduation_path = GraduationPath.new
    @course_types = GraduationPath::COURSE_TYPES
    5.times{@graduation_path.grad_programs.build()}
    
  end

  def create
  
    path = GraduationPath.create(path_params)
    path.update(user_id: current_user.id)
  
    if path.valid?
      redirect_to graduation_path_path(path)
    else
      flash[:errors] = path.errors.full_messages
      redirect_to new_graduation_path_path
    end
  end

  def edit
    @course_types = GraduationPath::COURSE_TYPES
  end

  def update
    @path.grad_programs.each{|gp| gp.destroy}
    @path.update(path_params)
  
    if @path.valid?
      redirect_to graduation_path_path(@path)
    else
      flash[:errors] = @path.errors.full_messages
      redirect_to edit_graduation_path_path
    end
  end

  def destroy
    @path.grad_programs.each{|gp| gp.destroy}
    @path.destroy
    redirect_to graduation_paths_path
  end

  private

  def find_path
    @path = GraduationPath.find(params[:id])
  end

  def path_params
    params["graduation_path"]["grad_programs_attributes"] = params["graduation_path"]["grad_programs_attributes"].select{|key,value| value["course_type"]!=""}
  
    params.require(:graduation_path).permit(:title, grad_programs_attributes: [
      :course_type,
      :course_count
    ])
  end
end
