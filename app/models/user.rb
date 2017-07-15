class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # has_secure_password

  has_many :orders

  after_create :save_account

  def previous_orders
    self.orders.where(status: 2).includes(order_items: :product)
  end

  def save_account
    Account.create(user_id: self.id)
  end

end
