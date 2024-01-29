require "application_system_test_case"

class ProductMovementsTest < ApplicationSystemTestCase
  setup do
    @product_movement = product_movements(:one)
  end

  test "visiting the index" do
    visit product_movements_url
    assert_selector "h1", text: "Product movements"
  end

  test "should create product movement" do
    visit product_movements_url
    click_on "New product movement"

    fill_in "Date movement", with: @product_movement.date_movement
    fill_in "From storehouse", with: @product_movement.from_storehouse_id
    fill_in "Product", with: @product_movement.product_id
    fill_in "Quantity", with: @product_movement.quantity
    fill_in "To storehouse", with: @product_movement.to_storehouse_id
    click_on "Create Product movement"

    assert_text "Product movement was successfully created"
    click_on "Back"
  end

  test "should update Product movement" do
    visit product_movement_url(@product_movement)
    click_on "Edit this product movement", match: :first

    fill_in "Date movement", with: @product_movement.date_movement
    fill_in "From storehouse", with: @product_movement.from_storehouse_id
    fill_in "Product", with: @product_movement.product_id
    fill_in "Quantity", with: @product_movement.quantity
    fill_in "To storehouse", with: @product_movement.to_storehouse_id
    click_on "Update Product movement"

    assert_text "Product movement was successfully updated"
    click_on "Back"
  end

  test "should destroy Product movement" do
    visit product_movement_url(@product_movement)
    click_on "Destroy this product movement", match: :first

    assert_text "Product movement was successfully destroyed"
  end
end
