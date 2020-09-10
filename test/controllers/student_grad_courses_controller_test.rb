require 'test_helper'

class StudentGradCoursesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get student_grad_courses_index_url
    assert_response :success
  end

  test "should get create" do
    get student_grad_courses_create_url
    assert_response :success
  end

end
