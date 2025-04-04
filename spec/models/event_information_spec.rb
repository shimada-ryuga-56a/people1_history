require 'rails_helper'

RSpec.describe EventInformation, type: :model do
  let(:correct_event_information) { build(:correct_event_information) }
  let(:no_body_event_information) { build(:no_body_event_information) }

  describe '正常系: バリデーション' do
    context '全ての属性が正しい場合' do
      it 'エラーなくEventInformationが作成される' do
        expect(correct_event_information).to be_valid
        expect(correct_event_information.errors).to be_empty
      end
    end
  end

  describe '正常系: リレーション' do
    context '正しくEventInformationが作成された場合' do
      it 'Userとの紐付けが正しく保存されること' do
        user = FactoryBot.create(:user)
        event = FactoryBot.create(:event)
        FactoryBot.create(:event_information, user: user, event: event, body: 'Sample body')
        expect(EventInformation.first.user).to eq user
      end
    end
  end

  describe '異常系: バリデーション' do
    context 'bodyが空の場合' do
      it 'エラーが発生する' do
        expect(no_body_event_information).to be_invalid
        expect(no_body_event_information.errors.messages[:body]).to include 'を入力してください'
      end
    end
  end
end
