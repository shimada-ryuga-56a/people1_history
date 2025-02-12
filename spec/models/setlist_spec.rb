require 'rails_helper'

RSpec.describe Setlist, type: :model do
  let (:setlist) { build(:setlist) }
  let (:correct_setlist) { build(:correct_setlist) }
  let (:no_setlistitems_setlist) { build(:no_setlistitems_setlist) }

  describe '異常系: バリデーション' do
    context 'setlistitemsが空の場合' do
      it 'at_least_one_setlistitemバリデーションに引っ掛かる' do
        expect(no_setlistitems_setlist).to be_invalid
        expect(no_setlistitems_setlist.errors.messages[:setlistitems]).to include 'は1つ以上必要です'
      end
    end
  end
end
