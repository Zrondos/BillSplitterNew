require 'test_helper'

class GuestsBillControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get guests_bill_index_url
    assert_response :success
  end

  test "should get show" do
    get guests_bill_show_url
    assert_response :success
  end

  test "should get edit" do
    get guests_bill_edit_url
    assert_response :success
  end

  test "should get delete" do
    get guests_bill_delete_url
    assert_response :success
  end

  test "should get create" do
    get guests_bill_create_url
    assert_response :success
  end

  test "should get update" do
    get guests_bill_update_url
    assert_response :success
  end

end
