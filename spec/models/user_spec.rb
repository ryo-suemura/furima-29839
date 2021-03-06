require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it '全ての項目が存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
      it 'emailが一意性でないと登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Eメールはすでに存在します")
      end
      it 'emailに@が含まれていないと登録できない' do
        @user.email = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールは@を含めてください")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it 'passwordが5文字以下であれば登録できない' do
        @user.password = 'a1a1a'
        @user.password_confirmation = 'a1a1a'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
      end
      it 'passwordは半角英数混合でなければ登録できない' do
        @user.password = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは半角英数混合で入力してください")
      end
      it 'passwordは半角英数混合でなければ登録できない' do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは半角英数混合で入力してください")
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it 'first_name_kanjiが空では登録できない' do
        @user.first_name_kanji = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名を入力してください")
      end
      it 'last_name_kanjiが空では登録できない' do
        @user.last_name_kanji = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("姓を入力してください")
      end
      it 'first_name_kanjiが全角日本語でないと登録できない' do
        @user.first_name_kanji = 'bob'
        @user.valid?
        expect(@user.errors.full_messages).to include("名は全角で入力してください")
      end
      it 'last_name_kanjiが全角日本語でないと登録できない' do
        @user.last_name_kanji = 'simons'
        @user.valid?
        expect(@user.errors.full_messages).to include("姓は全角で入力してください")
      end
      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("メイを入力してください")
      end
      it 'last_name_kanaが空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("セイを入力してください")
      end
      it 'first_name_kanaがカタカナでないと登録できない' do
        @user.first_name_kana = 'すずき'
        @user.valid?
        expect(@user.errors.full_messages).to include("メイは全角で入力してください")
      end
      it 'last_name_kanaがカタカナでないと登録できない' do
        @user.last_name_kana = 'tarou'
        @user.valid?
        expect(@user.errors.full_messages).to include("セイは全角で入力してください")
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("生年月日を入力してください")
      end
    end
  end
end
