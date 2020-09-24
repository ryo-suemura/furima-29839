FactoryBot.define do
  factory :item do
    name              { Faker::Name }
    text              { Faker::Lorem }
    category_id       { '2' }
    condition_id      { '2' }
    delivery_fee_id   {'2'}
    place_id          {'2'}
    days_id           {'2'}
    user_id           {'1'}
    price             {'333'}

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.jpg'), filename: 'test_image.jpg')
    end
  end
end
