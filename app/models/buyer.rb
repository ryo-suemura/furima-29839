class Buyer < ApplicationRecord
  belongs_to :purchase
  attr_accessor :token

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :place
end
