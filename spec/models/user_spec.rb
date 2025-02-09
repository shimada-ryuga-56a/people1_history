require 'rails_helper'

RSpec.describe User, type: :model do
  let (:correct_x_user) { build(:correct_x_user) }
  let (:no_email_x_user) { build(:no_email_x_user) }

  describe '正常系: バリデーション' do
    context '全ての属性が正しい場合' do
      it 'エラーなくUserが作成される' do
        expect(correct_x_user).to be_valid
        expect(correct_x_user.errors).to be_empty
      end
    end
  end

  describe '異常系: バリデーション' do
    context 'emailが空の場合' do
      it 'エラーが発生する' do
        expect(no_email_x_user).to be_invalid
        expect(no_email_x_user.errors.messages[:email]).to include 'を入力してください'
      end
    end
  end
end
