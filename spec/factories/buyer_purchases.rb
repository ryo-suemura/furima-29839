FactoryBot.define do
  factory :buyer_purchase do
    postal_code { '123-4567' }
    prefecture { '2' }
    city { '岐阜県' }
    address { '岐阜1-1' }
    building_name { 'アパート' }
    telephone { '11122223333' }
  end
end
