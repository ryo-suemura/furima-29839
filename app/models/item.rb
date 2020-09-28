class Item < ApplicationRecord
  has_one_attached :image
  has_one :purchase

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :place
  belongs_to_active_hash :days

  with_options presence: true do
    validates :name, :user_id, :text, :image
    validates :category_id, :condition_id, :delivery_fee_id, :place_id, :days_id, numericality: { other_than: 1 }
    validates :price, numericality: { with: /\A[0-9]+\z/, message: 'Half-Width number' }
    validates :price, inclusion: { in: 300..9_999_999, message: 'Out of setting range' }
  end
end
