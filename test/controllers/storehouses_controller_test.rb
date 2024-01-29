require "test_helper"

class StorehousesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @storehouse = storehouses(:one)
  end

  test "should get index" do
    get storehouses_url
    assert_response :success
  end

  test "should get new" do
    get new_storehouse_url
    assert_response :success
  end

  test "should create storehouse" do
    assert_difference("Storehouse.count") do
      post storehouses_url, params: { storehouse: { title: @storehouse.title } }
    end

    assert_redirected_to storehouse_url(Storehouse.last)
  end

  test "should show storehouse" do
    get storehouse_url(@storehouse)
    assert_response :success
  end

  test "should get edit" do
    get edit_storehouse_url(@storehouse)
    assert_response :success
  end

  test "should update storehouse" do
    patch storehouse_url(@storehouse), params: { storehouse: { title: @storehouse.title } }
    assert_redirected_to storehouse_url(@storehouse)
  end

  test "should destroy storehouse" do
    assert_difference("Storehouse.count", -1) do
      delete storehouse_url(@storehouse)
    end

    assert_redirected_to storehouses_url
  end
end
