require 'rails_helper'

RSpec.describe Event, type: :model do
  let(:correct_event) { build(:correct_event) }
  describe '正常系: バリデーション' do
    context '全ての属性が正しい場合' do
      it 'エラーなくEventが作成される' do
        expect(correct_event).to be_valid
        expect(correct_event.errors).to be_empty
      end
    end
  end
end
