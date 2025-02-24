require 'rails_helper'

RSpec.describe LinkViewCount, type: :model do
  describe '正常系: バリデーション' do
    context 'すべての属性が正しく設定されている場合' do
      it 'LinkViewCountが作成される' do
        link_view_count = create(:link_view_count)
        expect(link_view_count).to be_valid
        expect(link_view_count.errors).to be_empty
      end
    end
  end

  describe '異常系: バリデーション' do
    it { is_expected.to validate_presence_of :date }
    it { is_expected.to validate_presence_of :view_count }
  end
end
