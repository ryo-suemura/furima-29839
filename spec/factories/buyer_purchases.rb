FactoryBot.define do
  factory :buyer_purchase do
    token                    { 'tok_abcdefghijk00000000000000000' }
    postal_code              { '123-4567' }
    place_id                 { '2' }
    city                     { '岐阜県' }
    address                  { '岐阜1-1' }
    telephone_number         { '11122223333' }
  end
end
