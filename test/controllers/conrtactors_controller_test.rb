require "test_helper"

class ConrtactorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @conrtactor = conrtactors(:one)
  end

  test "should get index" do
    get conrtactors_url
    assert_response :success
  end

  test "should get new" do
    get new_conrtactor_url
    assert_response :success
  end

  test "should create conrtactor" do
    assert_difference("Conrtactor.count") do
      post conrtactors_url, params: { conrtactor: { email: @conrtactor.email, fullname: @conrtactor.fullname, manager: @conrtactor.manager, name: @conrtactor.name, type: @conrtactor.type } }
    end

    assert_redirected_to conrtactor_url(Conrtactor.last)
  end

  test "should show conrtactor" do
    get conrtactor_url(@conrtactor)
    assert_response :success
  end

  test "should get edit" do
    get edit_conrtactor_url(@conrtactor)
    assert_response :success
  end

  test "should update conrtactor" do
    patch conrtactor_url(@conrtactor), params: { conrtactor: { email: @conrtactor.email, fullname: @conrtactor.fullname, manager: @conrtactor.manager, name: @conrtactor.name, type: @conrtactor.type } }
    assert_redirected_to conrtactor_url(@conrtactor)
  end

  test "should destroy conrtactor" do
    assert_difference("Conrtactor.count", -1) do
      delete conrtactor_url(@conrtactor)
    end

    assert_redirected_to conrtactors_url
  end
end
