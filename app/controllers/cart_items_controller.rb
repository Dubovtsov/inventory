class CartItemsController < ApplicationController
  def create
    price = Price.find(params[:price_id])
    @cart_item = current_cart.cart_items.new(price: price)

    respond_to do |format|
      if @cart_item.save
        format.turbo_stream
      else
        format.html { redirect_to root_path, alert: 'Ошибка при добавлении в корзину' }
      end
    end
  end

  private

  def current_cart
    Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    cart = Cart.create
    session[:cart_id] = cart.id
    cart
  end
end
