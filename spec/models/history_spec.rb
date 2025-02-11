require 'rails_helper'

RSpec.describe History, type: :model do
  let(:history) { build(:history) }
  let(:correct_history) { build(:correct_history) }
  let(:no_title_history) { build(:no_title_history) }
  let(:no_date_history) { build(:no_date_history) }
  before do
    @user = FactoryBot.create(:user)
  end

  describe '正常系: バリデーション' do
    context '全ての属性が正しい場合' do
      it 'エラーなくHistoryが作成される' do
        expect(correct_history).to be_valid
        expect(correct_history.errors).to be_empty
      end
    end
  end

  describe '正常系: リレーション' do
    context '正しくHistoryが作成された場合' do
      it 'Userとの紐付けが正しく保存されること' do
        FactoryBot.create(:history, user: @user)
        expect(history.user).to eq @user
      end
    end
  end

  describe '異常系: バリデーション' do
    context 'titleが空の場合' do
      it 'エラーが発生する' do
        expect(no_title_history).to be_invalid
        expect(no_title_history.errors.messages[:title]).to include 'を入力してください'
      end
    end

    context 'dateが空の場合' do
      it 'エラーが発生する' do
        expect(no_date_history).to be_invalid
        expect(no_date_history.errors.messages[:date]).to include 'を入力してください'
      end
    end
  end
end
