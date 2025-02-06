class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one :order

  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_fee
  belongs_to :prefecture
  belongs_to :ship_day

  has_one_attached :image

  validates :image, :name, :description,
            :category_id, :condition_id, :shipping_fee_id,
            :prefecture_id, :ship_day_id, :price, presence: true

  validates :name, length: { maximum: 40 }
  validates :description, length: { maximum: 1000 }

  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

  validates :category_id, :condition_id, :shipping_fee_id,
            :prefecture_id, :ship_day_id, numericality: { other_than: 1, message: "can't be blank" }

  def sold_out?
    Order.exists?(item_id: id)
  end
end
