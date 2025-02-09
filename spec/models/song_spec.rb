require 'rails_helper'

RSpec.describe Song, type: :model do
  let (:correct_song) { build(:correct_song) }
  let (:no_name_song) { build(:no_name_song) }
  let (:no_name_hiragana_ruby_song) { build(:no_name_hiragana_ruby_song) }
  let (:incorrect_name_hiragana_ruby_song) { build(:incorrect_name_hiragana_ruby_song) }
  let (:no_name_kana_ruby_song) { build(:no_name_kana_ruby_song) }
  let (:incorrect_name_kana_ruby_song) { build(:incorrect_name_kana_ruby_song) }
  describe 'バリデーションチェック' do
    it '設定したすべてのバリデーションが機能しているか' do
      song = create(:song)
      expect(song).to be_valid
      expect(song.errors).to be_empty
    end
    it '複数のリンクと紐付けられるか' do
      song = create(:song)
      link = create(:link)
      link_content = create(:link_content, linkable_id: song.id, linkable_type: 'Song', link_id: link.id)
      expect(link_content).to be_valid
      expect(link_content.errors).to be_empty
    end
  end
end
