require 'rails_helper'

RSpec.describe Song, type: :model do
  let (:correct_song) { build(:correct_song) }
  let (:no_name_song) { build(:no_name_song) }
  let (:no_name_hiragana_ruby_song) { build(:no_name_hiragana_ruby_song) }
  let (:incorrect_name_hiragana_ruby_song) { build(:incorrect_name_hiragana_ruby_song) }
  let (:no_name_kana_ruby_song) { build(:no_name_kana_ruby_song) }
  let (:incorrect_name_kana_ruby_song) { build(:incorrect_name_kana_ruby_song) }
  describe '[Model : Song] Success - バリデーションの確認' do
    context '全ての属性が正しい場合' do
      it 'エラーなくSongが作成される' do
        expect(correct_song).to be_valid
        expect(correct_song.errors).to be_empty
      end
    end
  end
end
