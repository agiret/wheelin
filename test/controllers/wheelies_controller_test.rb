require 'test_helper'

class WheeliesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get wheelies_index_url
    assert_response :success
  end

  test "should get show" do
    get wheelies_show_url
    assert_response :success
  end

  test "should get search" do
    get wheelies_search_url
    assert_response :success
  end

  test "should get new" do
    get wheelies_new_url
    assert_response :success
  end

  test "should get create" do
    get wheelies_create_url
    assert_response :success
  end

  test "should get edit" do
    get wheelies_edit_url
    assert_response :success
  end

  test "should get update" do
    get wheelies_update_url
    assert_response :success
  end

  test "should get destroy" do
    get wheelies_destroy_url
    assert_response :success
  end

end
