require "test_helper"

class InvoiceProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @invoice_product = invoice_products(:one)
  end

  test "should get index" do
    get invoice_products_url
    assert_response :success
  end

  test "should get new" do
    get new_invoice_product_url
    assert_response :success
  end

  test "should create invoice_product" do
    assert_difference("InvoiceProduct.count") do
      post invoice_products_url, params: { invoice_product: { closed: @invoice_product.closed, invoice_id: @invoice_product.invoice_id, product_id: @invoice_product.product_id } }
    end

    assert_redirected_to invoice_product_url(InvoiceProduct.last)
  end

  test "should show invoice_product" do
    get invoice_product_url(@invoice_product)
    assert_response :success
  end

  test "should get edit" do
    get edit_invoice_product_url(@invoice_product)
    assert_response :success
  end

  test "should update invoice_product" do
    patch invoice_product_url(@invoice_product), params: { invoice_product: { closed: @invoice_product.closed, invoice_id: @invoice_product.invoice_id, product_id: @invoice_product.product_id } }
    assert_redirected_to invoice_product_url(@invoice_product)
  end

  test "should destroy invoice_product" do
    assert_difference("InvoiceProduct.count", -1) do
      delete invoice_product_url(@invoice_product)
    end

    assert_redirected_to invoice_products_url
  end
end
