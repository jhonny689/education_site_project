class NotesController < ApplicationController
  def index
  end

  def show
  end

  def create
    byebug
    note = Note.new(params.require(:note).permit(:title, :body, :lesson_id))
    note.user_id = current_user.id
    
    note.save
    redirect_to lesson_path(params[:note][:lesson_id])
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
