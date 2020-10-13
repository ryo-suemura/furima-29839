class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :purchase
  

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :place
  belongs_to_active_hash :days

  with_options presence: true do
    validates :name, :user, :text, :image
    validates :category_id, :condition_id, :delivery_fee_id, :place_id, :days_id, numericality: { other_than: 1 }
    validates :price, numericality: { with: /\A[0-9]+\z/, message: "は半角数字で入力してください" }
    validates :price, inclusion: { in: 300..9_999_999, message: "が範囲外です" }
  end
end
