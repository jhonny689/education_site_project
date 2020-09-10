class StudentGradsController < ApplicationController
  def index
  end

  def show
    
  end

  def new
    @student_id = params[:student_id]
    @user = User.find(params[:student_id])
    @programs = current_user.programs
    @student_grad = StudentGrad.new
  end

  def create

    test = StudentGrad.create(params.require(:student_grad).permit(:graduation_path_id, :user_id))

    user_profile = User.find(params[:student_grad][:user_id]).user_profile
    redirect_to user_profile_path(user_profile)
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
