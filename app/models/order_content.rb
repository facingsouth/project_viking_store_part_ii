class OrderContent < ActiveRecord::Base
  belongs_to :order
  belongs_to :product

  def product_total_price
    product.price * quantity
  end
end
