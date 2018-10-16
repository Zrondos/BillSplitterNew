require 'test_helper'

class BillsItemControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get bills_item_index_url
    assert_response :success
  end

  test "should get show" do
    get bills_item_show_url
    assert_response :success
  end

  test "should get edit" do
    get bills_item_edit_url
    assert_response :success
  end

  test "should get delete" do
    get bills_item_delete_url
    assert_response :success
  end

  test "should get create" do
    get bills_item_create_url
    assert_response :success
  end

  test "should get update" do
    get bills_item_update_url
    assert_response :success
  end

end
