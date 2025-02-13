require 'rails_helper'

RSpec.describe Setlistitem, type: :model do
  let(:setlistitem) { build(:setlistitem) }
  let(:correct_setlistitem) { build(:correct_setlistitem) }
  before do
    @song = FactoryBot.create(:song)
  end

  describe '正常系: バリデーション' do
    context '全ての属性が正しい場合' do
      it 'エラーなくSetlistitemが作成される' do
        expect(correct_setlistitem).to be_valid
        expect(correct_setlistitem.errors).to be_empty
      end
    end
  end

  describe '正常系: 独自メソッド' do
    context 'song_titleが既存のSongに存在する場合' do
      it 'set_song_idメソッドが正しく動作する' do
        setlistitem_with_existed_song = FactoryBot.create(:setlistitem, song_title: @song.name)
        setlistitem_with_existed_song.set_song_id
        expect(setlistitem_with_existed_song.song_id == @song.id).to be_truthy
      end
    end
  end

  describe '異常系: バリデーション' do
    it { is_expected.to validate_presence_of :song_title }
  end
end
