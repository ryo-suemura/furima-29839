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
        expect(@buyer_purchase.errors.full_messages).to include("クレジットカード情報を入力してください")
      end
      it 'postal_codeがなければ購入できない' do
        @buyer_purchase.postal_code = ''
        @buyer_purchase.valid?
        expect(@buyer_purchase.errors.full_messages).to include("郵便番号を入力してください")
      end
      it 'postal_codeにハイフンがなければ購入できない' do
        @buyer_purchase.postal_code = '1234567'
        @buyer_purchase.valid?
        expect(@buyer_purchase.errors.full_messages).to include('郵便番号は正しく入力してください')
      end
      it 'place_idがなければ購入できない' do
        @buyer_purchase.place_id = '1'
        @buyer_purchase.valid?
        expect(@buyer_purchase.errors.full_messages).to include('都道府県は1以外の値にしてください')
      end
      it 'cityがなければ購入できない' do
        @buyer_purchase.city = ''
        @buyer_purchase.valid?
        expect(@buyer_purchase.errors.full_messages).to include("市区町村を入力してください")
      end
      it 'addressがなければ購入できない' do
        @buyer_purchase.address = ''
        @buyer_purchase.valid?
        expect(@buyer_purchase.errors.full_messages).to include("番地を入力してください")
      end
      it 'telephone_numberがなければ購入できない' do
        @buyer_purchase.telephone_number = ''
        @buyer_purchase.valid?
        expect(@buyer_purchase.errors.full_messages).to include("電話番号を入力してください")
      end
      it 'telephone_numberは11桁以内でなければ購入できない' do
        @buyer_purchase.telephone_number = '111222233334'
        @buyer_purchase.valid?
        expect(@buyer_purchase.errors.full_messages).to include('電話番号は11文字以下で入力してください')
      end
    end
  end
end
