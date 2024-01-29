require "application_system_test_case"

class StorehousesTest < ApplicationSystemTestCase
  setup do
    @storehouse = storehouses(:one)
  end

  test "visiting the index" do
    visit storehouses_url
    assert_selector "h1", text: "Storehouses"
  end

  test "should create storehouse" do
    visit storehouses_url
    click_on "New storehouse"

    fill_in "Title", with: @storehouse.title
    click_on "Create Storehouse"

    assert_text "Storehouse was successfully created"
    click_on "Back"
  end

  test "should update Storehouse" do
    visit storehouse_url(@storehouse)
    click_on "Edit this storehouse", match: :first

    fill_in "Title", with: @storehouse.title
    click_on "Update Storehouse"

    assert_text "Storehouse was successfully updated"
    click_on "Back"
  end

  test "should destroy Storehouse" do
    visit storehouse_url(@storehouse)
    click_on "Destroy this storehouse", match: :first

    assert_text "Storehouse was successfully destroyed"
  end
end
