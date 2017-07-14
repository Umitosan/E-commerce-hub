class Order < ApplicationRecord
  has_many :order_items
  belongs_to :user, optional: true

  before_save :update_total

  def update_total
    self.total_price = order_items.collect { |item| item.product.price * item.quantity }.sum
  end

  def finalize(user)
    self.user_id = user.id
    self.status = 2
    self.save
  end
end
