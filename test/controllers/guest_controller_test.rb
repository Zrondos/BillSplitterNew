require 'test_helper'

class GuestControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get guest_index_url
    assert_response :success
  end

  test "should get show" do
    get guest_show_url
    assert_response :success
  end

  test "should get edit" do
    get guest_edit_url
    assert_response :success
  end

  test "should get delete" do
    get guest_delete_url
    assert_response :success
  end

  test "should get create" do
    get guest_create_url
    assert_response :success
  end

  test "should get update" do
    get guest_update_url
    assert_response :success
  end

end
