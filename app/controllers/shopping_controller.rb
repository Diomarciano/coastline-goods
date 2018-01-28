class ShoppingController < ApplicationController
	before_filter :authenticate_user!, unless: :devise_controller?, except: [:index]
	
def add_to_cart
   quantity = params[:quantity].to_i
   product_id = params[:product]
   @product = Product.find(product_id)
   @shopping_cart.add(@product, @product.price, quantity)
   redirect_to  request.referer || "/"
   flash[:notice] = "#{@product.name} has been added to the Cart."
 end

 
 def create_order
  total_price_delivery = 0
  total_price_items = @shopping_cart.total_items
  total_all_price = total_price_delivery + total_price_items

  @order = Order.new
  @order.number = "#{current_user.id}-#{Time.now.to_i}"
  @order.user_id = current_user.id
  @order.total_price_items = total_price_items
  @order.total_all_price = total_all_price

  @order.receiver_name = params[:receiver_name]
  @order.receiver_mobile_number = params[:receiver_mobile_number]
  @order.receiver_city = params[:receiver_city]
  @order.receiver_address = params[:receiver_address]
  @order.receiver_postal_code = params[:receiver_postal_code]
  @order.receiver_province = params[:receiver_province]
  @order.save
  @shopping_cart.update(:order_id => @order.id)
  redirect_to @order
  flash[:notice] = "Your Order has been created"
 end


 def cart_items
  render :template => 'shopping/cart_items'
 end
end
