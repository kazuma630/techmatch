require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nameとemail、passwordとpassword_confirmationが存在すれば保存できる" do
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nameが空だと登録できない" do
        @user.name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("名前を入力してください")
      end
      it "emailが空では登録できない" do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Eメールはすでに存在します")
      end
      it "emaiに@がついていない場合は保存できない" do
        @user.email = "aaa.com"
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールは不正な値です")
      end
      it "passwordが空では登録できない" do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it "passwordが7文字以下であれば登録できない" do
        @user.password = "a111111"
        @user.password_confirmation = "a111111"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは半角英数字8~20文字内で数字・英字それぞれ1文字以上含む必要があります")
      end
      it "passwordが半角英数字混合でなければ登録できない" do
        @user.password = "11111111"
        @user.password_confirmation = "11111111"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは半角英数字8~20文字内で数字・英字それぞれ1文字以上含む必要があります")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
    end
  end
end
