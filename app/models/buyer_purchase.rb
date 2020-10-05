class BuyerPurchase

  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :place_id, :city, :address, :building_name, :telephone_number, :purchase_id, :token

  with_options presence: true do
    validates :token
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'input correctly'}
    validates :place_id, numericality: { other_than: 1}
    validates :city, :address
    validates :telephone_number, format: { with: /\A\d{10,11}\z/, message: 'is under 11 degit' }
   end

   def save
     purchase = Purchase.create(user_id: user_id, item_id: item_id)
     Buyer.create(postal_code: postal_code, place_id: place_id, city: city, address: address, building_name: building_name, 
      telephone_number: telephone_number, purchase_id: purchase.id)
   end

end