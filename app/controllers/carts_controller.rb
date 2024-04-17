class CartsController < ApplicationController

  def show
    @cart = current_cart
  end

  def create
    product = Product.find(params[:product_id])
    @cart_item = current_cart.cart_items.new(product: product)

    respond_to do |format|
      if @cart_item.save
        format.turbo_stream
      else
        format.html { redirect_to root_path, alert: 'Ошибка при добавлении в корзину' }
      end
    end
  end

  def update
    @cart_item = current_cart.cart_items.find(params[:id])
    @cart_item.update(quantity: params[:quantity])

    respond_to do |format|
      format.turbo_stream
    end
  end

  def destroy
    @cart_item = current_cart.cart_items.find(params[:id])
    @cart_item.destroy

    respond_to do |format|
      format.turbo_stream
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
