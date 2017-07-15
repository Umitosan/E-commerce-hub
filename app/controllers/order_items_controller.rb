class OrderItemsController < ApplicationController

  def create
    @order = current_order

    need_to_create_item = true

    # if there's a duplicate item ... update the quantity instead of creating a new one
    @order.order_items.each do |i|
      if (i.product_id == item_params["product_id"].to_i)
        sum = i.quantity + item_params["quantity"].to_i
        i.update(quantity: sum)
        need_to_create_item = false
      end
    end

    # if no items of this type exist, create a new one
    if need_to_create_item
      @order.order_items.new(item_params)
      @order.save
    end

    session[:order_id] = @order.id
    respond_to do |format|
      format.html { redirect_to products_url  }
      format.js
    end
  end

  def update
    @order = current_order
    @item = @order.order_items.find(params[:id])
    @item.update_attributes(item_params)
    @order.save
  end

  def destroy
    @order = current_order
    @item = @order.order_items.find(params[:id])
    @item.destroy
    @order.save
    @order_items = current_order.order_items
    respond_to do |format|
      format.html { redirect_to cart_url  }
      format.js
    end
  end

  private

  def item_params
    params.require(:order_item).permit(:quantity, :product_id)
  end
end
