require 'rails_helper'

RSpec.describe Setlistitem, type: :model do
  let (:setlistitem) { build(:setlistitem) }
  let (:correct_setlistitem) { build(:correct_setlistitem) }
  let (:setlistitem_with_existed_song) { build(:setlistitem_with_existed_song) }

  describe '正常系: バリデーション' do
    context '全ての属性が正しい場合' do
      it 'エラーなくSetlistitemが作成される' do
        expect(correct_setlistitem).to be_valid
        expect(correct_setlistitem.errors).to be_empty
      end
    end
  end
end
