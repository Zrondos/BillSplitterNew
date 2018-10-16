require 'test_helper'

class GroupBillControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get group_bill_index_url
    assert_response :success
  end

  test "should get show" do
    get group_bill_show_url
    assert_response :success
  end

  test "should get edit" do
    get group_bill_edit_url
    assert_response :success
  end

  test "should get delete" do
    get group_bill_delete_url
    assert_response :success
  end

  test "should get create" do
    get group_bill_create_url
    assert_response :success
  end

  test "should get update" do
    get group_bill_update_url
    assert_response :success
  end

end
