require 'rails_helper'

RSpec.describe AdminUser, type: :model do
  let(:admin_user) { build(:admin_user) }

  describe '正常系: バリデーション' do
    context '全ての属性が正しい場合' do
      it 'エラーなくAdminUserが作成される' do
        expect(admin_user).to be_valid
        expect(admin_user.errors).to be_empty
      end
    end
  end

  describe '異常系: バリデーション' do
    it { is_expected.to validate_presence_of :email }
    it { is_expected.to validate_presence_of :password }

    context "passwordとpassword_confirmationが一致しない場合" do
      it "エラーが発生する" do
        admin_user.password_confirmation = "different_password"
        expect(admin_user).not_to be_valid
        expect(admin_user.errors[:password_confirmation]).to include("とPasswordの入力が一致しません")
      end
    end
  end
end
