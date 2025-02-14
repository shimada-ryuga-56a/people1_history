require 'rails_helper'

RSpec.describe LinkView, type: :model do
  let (:link_view) { build(:link_view) }
  let (:correct_link_view) { build(:correct_link_view) }

  describe '正常系: バリデーション' do
    context '全ての属性が正しい場合' do
      it 'エラーなくLinkViewが作成される' do
        expect(correct_link_view).to be_valid
        expect(correct_link_view.errors).to be_empty
      end
    end
  end

  describe '異常系: バリデーション' do
    it { is_expected.to validate_presence_of :date }
    it { is_expected.to validate_presence_of :record_type }
  end
end
