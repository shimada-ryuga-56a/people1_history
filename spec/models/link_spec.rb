require 'rails_helper'

RSpec.describe Link, type: :model do
  describe '正常系: バリデーション' do
    context 'すべての属性が正しく設定されている場合' do
      it 'リンクが作成される' do
        link = create(:link)
        expect(link).to be_valid
        expect(link.errors).to be_empty
      end
    end
  end

  describe '異常系: バリデーション' do
    it { is_expected.to validate_presence_of :platform }
    it { is_expected.to validate_presence_of :url_link }
    it { is_expected.to validate_presence_of :remark }
  end
end
