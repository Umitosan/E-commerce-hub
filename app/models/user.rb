class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # has_secure_password

  has_many :orders

  def previous_orders
    self.orders.where(status: 2).includes(order_items: :product)
  end

end
