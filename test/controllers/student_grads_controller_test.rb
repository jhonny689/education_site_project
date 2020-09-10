require 'test_helper'

class StudentGradsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get student_grads_index_url
    assert_response :success
  end

  test "should get show" do
    get student_grads_show_url
    assert_response :success
  end

  test "should get new" do
    get student_grads_new_url
    assert_response :success
  end

  test "should get create" do
    get student_grads_create_url
    assert_response :success
  end

  test "should get edit" do
    get student_grads_edit_url
    assert_response :success
  end

  test "should get update" do
    get student_grads_update_url
    assert_response :success
  end

  test "should get destroy" do
    get student_grads_destroy_url
    assert_response :success
  end

end
