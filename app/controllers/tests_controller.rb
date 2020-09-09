class TestsController < ApplicationController
  before_action :find_test, only: [:show, :edit, :update, :destroy]
  def index
    @tests = Test.all
  end

  def show
  end

  def new
    @test = Test.new
  end

  def create
    test = Test.create(test_params)
    if test.valid?
      redirect_to test_path(test)
    else
      flash[:errors] = test.errors.full_messages
      redirect_to new_test_path
    end
  end

  def edit
  end

  def update
    test = @test.update(test_params)
    if test.valid?
      redirect_to test_path(test)
    else
      flash[:errors] = test.errors.full_messages
      redirect_to edit_test_path
    end
  end

  def destroy
    @test.destroy
  end
  
  private
  def find_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:title, :status, :content)
  end

end
