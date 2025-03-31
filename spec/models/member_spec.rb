require 'rails_helper'

RSpec.describe Member, type: :model do
  let (:member) { build(:member) }
  describe '正常系: バリデーション' do
    context '全ての属性が正しい場合' do
      it 'エラーなくMemberが作成される' do
        expect(member).to be_valid
        expect(member.errors).to be_empty
      end
    end
  end

  describe '異常系: バリデーション' do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :name_ruby }
    it { is_expected.to validate_presence_of :role }
  end
end
