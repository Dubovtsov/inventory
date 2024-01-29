require "test_helper"

class ProductMovementsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product_movement = product_movements(:one)
  end

  test "should get index" do
    get product_movements_url
    assert_response :success
  end

  test "should get new" do
    get new_product_movement_url
    assert_response :success
  end

  test "should create product_movement" do
    assert_difference("ProductMovement.count") do
      post product_movements_url, params: { product_movement: { date_movement: @product_movement.date_movement, from_storehouse_id: @product_movement.from_storehouse_id, product_id: @product_movement.product_id, quantity: @product_movement.quantity, to_storehouse_id: @product_movement.to_storehouse_id } }
    end

    assert_redirected_to product_movement_url(ProductMovement.last)
  end

  test "should show product_movement" do
    get product_movement_url(@product_movement)
    assert_response :success
  end

  test "should get edit" do
    get edit_product_movement_url(@product_movement)
    assert_response :success
  end

  test "should update product_movement" do
    patch product_movement_url(@product_movement), params: { product_movement: { date_movement: @product_movement.date_movement, from_storehouse_id: @product_movement.from_storehouse_id, product_id: @product_movement.product_id, quantity: @product_movement.quantity, to_storehouse_id: @product_movement.to_storehouse_id } }
    assert_redirected_to product_movement_url(@product_movement)
  end

  test "should destroy product_movement" do
    assert_difference("ProductMovement.count", -1) do
      delete product_movement_url(@product_movement)
    end

    assert_redirected_to product_movements_url
  end
end
