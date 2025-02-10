require 'rails_helper'

RSpec.describe SongInformation, type: :model do
  let(:correct_song_information) { build(:correct_song_information) }
  let(:no_body_song_information) { build(:no_body_song_information) }
  describe '正常系: バリデーション' do
    context '全ての属性が正しい場合' do
      it 'エラーなくSongInformationが作成される' do
        expect(correct_song_information).to be_valid
        expect(correct_song_information.errors).to be_empty
      end
    end
  end

  describe '異常系: バリデーション' do
    context 'bodyが空の場合' do
      it 'エラーが発生する' do
        expect(no_body_song_information).to be_invalid
        expect(no_body_song_information.errors.messages[:body]).to include 'を入力してください'
      end
    end
  end
end
