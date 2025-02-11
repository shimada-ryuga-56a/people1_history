require 'rails_helper'

RSpec.describe Event, type: :model do
  let(:event) { build(:event) }
  let(:correct_event) { build(:correct_event) }
  before do
    @user = FactoryBot.create(:user)
  end

  describe '正常系: バリデーション' do
    context '全ての属性が正しい場合' do
      it 'エラーなくEventが作成される' do
        expect(correct_event).to be_valid
        expect(correct_event.errors).to be_empty
      end
    end
  end

  describe '正常系: 独自メソッド' do
    context '正しくイベントがブックマークされた場合' do
      it 'Userとの紐付けが正しく保存されること' do
        FactoryBot.create(:event_bookmark, user: @user, event: event)
        expect(event.bookmarked_by?(@user)).to be_truthy
      end
    end
  end

  describe '異常系: バリデーション' do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :date }
    it { is_expected.to validate_presence_of :category }
    it { is_expected.to validate_presence_of :name_kana_ruby }
  end
end
