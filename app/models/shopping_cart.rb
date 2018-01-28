class ShoppingCart < ActiveRecord::Base
  acts_as_shopping_cart
  belongs_to :user
  belongs_to :order

   def subtotals
    self.cart_items.map { |i| i.subtotal }
  end

  def total_items
   subtotals.sum
  end
  
end
