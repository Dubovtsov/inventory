require "application_system_test_case"

class ConrtactorsTest < ApplicationSystemTestCase
  setup do
    @conrtactor = conrtactors(:one)
  end

  test "visiting the index" do
    visit conrtactors_url
    assert_selector "h1", text: "Conrtactors"
  end

  test "should create conrtactor" do
    visit conrtactors_url
    click_on "New conrtactor"

    fill_in "Email", with: @conrtactor.email
    fill_in "Fullname", with: @conrtactor.fullname
    fill_in "Manager", with: @conrtactor.manager
    fill_in "Name", with: @conrtactor.name
    fill_in "Type", with: @conrtactor.type
    click_on "Create Conrtactor"

    assert_text "Conrtactor was successfully created"
    click_on "Back"
  end

  test "should update Conrtactor" do
    visit conrtactor_url(@conrtactor)
    click_on "Edit this conrtactor", match: :first

    fill_in "Email", with: @conrtactor.email
    fill_in "Fullname", with: @conrtactor.fullname
    fill_in "Manager", with: @conrtactor.manager
    fill_in "Name", with: @conrtactor.name
    fill_in "Type", with: @conrtactor.type
    click_on "Update Conrtactor"

    assert_text "Conrtactor was successfully updated"
    click_on "Back"
  end

  test "should destroy Conrtactor" do
    visit conrtactor_url(@conrtactor)
    click_on "Destroy this conrtactor", match: :first

    assert_text "Conrtactor was successfully destroyed"
  end
end
