class Item < ApplicationRecord
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :delivery_fee

  validates :name, :text, :price, :category, :condition, :delivery_fee, :place, :days, :user_id, presence:true
  validates :category_id, numericality: { other_than: 1}
end
