require 'test_helper'

class BillControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get bill_index_url
    assert_response :success
  end

  test "should get show" do
    get bill_show_url
    assert_response :success
  end

  test "should get edit" do
    get bill_edit_url
    assert_response :success
  end

  test "should get delete" do
    get bill_delete_url
    assert_response :success
  end

  test "should get create" do
    get bill_create_url
    assert_response :success
  end

  test "should get update" do
    get bill_update_url
    assert_response :success
  end

end
