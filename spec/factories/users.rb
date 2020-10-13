FactoryBot.define do
  factory :user do
    nickname              { Faker::Name }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6) + '1a' }
    password_confirmation { password }
    first_name_kanji      { '鈴木' }
    last_name_kanji       { '太郎' }
    first_name_kana       { 'スズキ' }
    last_name_kana        { 'タロウ' }
    birthday              { '2020-01-01' }
    
  end
end
