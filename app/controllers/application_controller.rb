class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  helper_method :admin
  helper_method :current_order
  helper_method :current_order_itmes_total
  helper_method :current_order_price

  def admin
    current_user && current_user.admin
  end

  def current_order
    session[:order_id] ? Order.find(session[:order_id]) : Order.new
  end

  def authorize
    redirect_to new_user_session_path unless admin
  end

  def current_order_itmes_total
    quantity = 0
    current_order.order_items.each do |item|
      quantity += item.quantity
    end
    return quantity
  end

  def current_order_price
    price = 0
    current_order.order_items.each do |item|
      price += (item.quantity.to_f * item.product.price.to_f)
    end
    return price
  end

end
