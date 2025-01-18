class CartItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :current_user_cart_items, only: [:update, :destroy]
  def create
    @cart = current_user.cart || current_user.create_cart
    @cart_item = @cart.cart_items.find_or_initialize_by(product_id: params[:product_id])

    @cart_item.quantity ||= 0
    @cart_item.quantity += params[:quantity].to_i

    if @cart_item.save
      redirect_to cart_path, notice: "Product added to cart successfully!"
    else
      redirect_to products_path, alert: "Failed to add product to cart."
    end
  end

  def update
    
    if @cart_item.update(cart_item_params)
      redirect_to cart_path, notice: "Cart updated successfully!"
    else
      redirect_to cart_path, alert: "Failed to update the cart."
    end
  end

  def destroy
   
    if @cart_item.destroy
      redirect_to cart_path, notice: "Item removed from cart successfully!"
    else
      redirect_to cart_path, alert: "Failed to remove item from cart."
    end
  end

  private


  def cart_item_params
    params.require(:cart_item).permit(:quantity)
  end
  def current_user_cart_items
    @cart_item = current_user.cart.cart_items.find(params[:id])
  end
end
