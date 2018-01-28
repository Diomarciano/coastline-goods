require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "can't delete product in cart" do
    assert_difference('Product.count', 0) do
      delete :destroy, :id => products(:ruby).to_param
    end
 
    assert_redirected_to products_path
  end
 
  test "should destroy product" do
    assert_difference('Product.count', -1) do
      delete :destroy, :id => @product.to_param
    end
 
    assert_redirected_to lihat_path
  end

end
