class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :set_current_cart

  private

  def set_current_cart
    @current_cart = current_cart
  end

  def current_cart
    Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    cart = Cart.create
    session[:cart_id] = cart.id
    cart
  end

end
