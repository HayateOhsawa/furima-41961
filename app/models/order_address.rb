class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :address, :building_name, :phone_number, :token

  validates :postal_code, presence: true, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
  validates :prefecture_id, presence: true, numericality: { other_than: 1, message: 'Select' }
  validates :city, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true, numericality: { only_integer: true }
  validates :token, presence: true

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(order_id: order.id, postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address,
                   building_name: building_name, phone_number: phone_number)
  end
end
