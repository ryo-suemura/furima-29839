require 'rails_helper'

RSpec.describe BuyerPurchase, type: :model do
  before do
    @buyer_purchase = FactoryBot.build(:buyer_purchase)
  end

  describe '商品購入' do
    context '商品購入がうまくいくとき' do
      it '全ての項目が存在すれば購入できる' do
        expect(@buyer_purchase).to be_valid
      end
      it 'building_nameがなくても購入できる' do
        @buyer_purchase.building_name = ''
        expect(@buyer_purchase).to be_valid
      end
    end

    context '商品購入がうまくいかないとき' do
      it 'token情報がなければ購入できない' do
        @buyer_purchase.token = ''
        @buyer_purchase.valid?
        expect(@buyer_purchase.errors.full_messages).to include("Token can't be blank")
      end
      it 'postal_codeがなければ購入できない' do
        @buyer_purchase.postal_code = ''
        @buyer_purchase.valid?
        expect(@buyer_purchase.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeにハイフンがなければ購入できない' do
        @buyer_purchase.postal_code = '1234567'
        @buyer_purchase.valid?
        expect(@buyer_purchase.errors.full_messages).to include('Postal code input correctly')
      end
      it 'place_idがなければ購入できない' do
        @buyer_purchase.place_id = '1'
        @buyer_purchase.valid?
        expect(@buyer_purchase.errors.full_messages).to include('Place must be other than 1')
      end
      it 'cityがなければ購入できない' do
        @buyer_purchase.city = ''
        @buyer_purchase.valid?
        expect(@buyer_purchase.errors.full_messages).to include("City can't be blank")
      end
      it 'addressがなければ購入できない' do
        @buyer_purchase.address = ''
        @buyer_purchase.valid?
        expect(@buyer_purchase.errors.full_messages).to include("Address can't be blank")
      end
      it 'telephone_numberがなければ購入できない' do
        @buyer_purchase.telephone_number = ''
        @buyer_purchase.valid?
        expect(@buyer_purchase.errors.full_messages).to include("Telephone number can't be blank")
      end
      it 'telephone_numberは11桁以内でなければ購入できない' do
        @buyer_purchase.telephone_number = '111222233334'
        @buyer_purchase.valid?
        expect(@buyer_purchase.errors.full_messages).to include('Telephone number is under 11 degit')
      end
    end
  end
end
