require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品登録がうまくいくとき' do
      it '全ての項目が存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '商品登録がうまくいかないとき' do
      it 'nameがなければ登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end
      it 'textがなければ登録できない' do
        @item.text = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の説明を入力してください")
      end
      it 'imageがなければ登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("出品画像を入力してください")
      end
      it 'category_idがなければ登録できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('カテゴリーは1以外の値にしてください')
      end
      it 'condition_idがなければ登録できない' do
        @item.condition_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('商品の状態は1以外の値にしてください')
      end
      it 'delivery_fee_idがなければ登録できない' do
        @item.delivery_fee_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('配送料の負担は1以外の値にしてください')
      end
      it 'place_idがなければ登録できない' do
        @item.place_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('発送元の地域は1以外の値にしてください')
      end
      it 'days_idがなければ登録できない' do
        @item.days_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数は1以外の値にしてください")
      end
      it 'priceがなければ登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格を入力してください")
      end
      it 'priceの範囲が300~9999999の間でなければ登録できない' do
        @item.price = '100'
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格が範囲外です')
      end
      it 'priceは半角でなければ登録できない' do
        @item.price = '４４４'
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格は半角数字で入力してください')
      end
    end
  end
end
