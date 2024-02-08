require "application_system_test_case"

class InvoiceProductsTest < ApplicationSystemTestCase
  setup do
    @invoice_product = invoice_products(:one)
  end

  test "visiting the index" do
    visit invoice_products_url
    assert_selector "h1", text: "Invoice products"
  end

  test "should create invoice product" do
    visit invoice_products_url
    click_on "New invoice product"

    check "Closed" if @invoice_product.closed
    fill_in "Invoice", with: @invoice_product.invoice_id
    fill_in "Product", with: @invoice_product.product_id
    click_on "Create Invoice product"

    assert_text "Invoice product was successfully created"
    click_on "Back"
  end

  test "should update Invoice product" do
    visit invoice_product_url(@invoice_product)
    click_on "Edit this invoice product", match: :first

    check "Closed" if @invoice_product.closed
    fill_in "Invoice", with: @invoice_product.invoice_id
    fill_in "Product", with: @invoice_product.product_id
    click_on "Update Invoice product"

    assert_text "Invoice product was successfully updated"
    click_on "Back"
  end

  test "should destroy Invoice product" do
    visit invoice_product_url(@invoice_product)
    click_on "Destroy this invoice product", match: :first

    assert_text "Invoice product was successfully destroyed"
  end
end
