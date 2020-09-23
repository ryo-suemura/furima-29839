class Item < ApplicationRecord
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :place
  belongs_to_active_hash :day

  validates :name, :text, :price, :category, :condition, :delivery_fee, :place, :days, :user_id, presence:true
  validates :category_id, :condition_id, :delivery_fee_id, :place_id, :days_id, numericality: { other_than: 1}
  validates :price, inclusion: { in: 300..9999999, message: "Out of setting range" }, format: { with: /\A[0-9]+\z/, message: "Half-Width number"}


end
