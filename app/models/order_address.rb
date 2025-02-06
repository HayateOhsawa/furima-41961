class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :address, :building_name, :phone_number, :token

  with_options presence: true do
    validates :postal_code,     format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture_id,   numericality: { other_than: 1, message: 'Select' }
    validates :city
    validates :address
    validates :phone_number, numericality: { only_integer: true }, length: { in: 10..11 },
                             format: { with: /\A[0-9]+\z/, message: 'is invalid. Input only number' }
    validates :token
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(order_id: order.id, postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address,
                   building_name: building_name, phone_number: phone_number)
  end
end
