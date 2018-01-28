class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :shopping_cart

  def shopping_cart
     if current_user.present?
        shopping_cart = ShoppingCart.where('order_id is null').where(user_id: current_user.id).try(:last)
        shopping_cart = shopping_cart.present? ? shopping_cart : ShoppingCart.create(user_id: current_user.id)
        @shopping_cart = shopping_cart
     end
  end
 
end
