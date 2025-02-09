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

  describe '[Model : Song] Failure - バリデーションの確認' do
    context 'nameが空の場合' do
      it 'エラーが発生する' do
        expect(no_name_song).to be_invalid
        expect(no_name_song.errors.messages[:name]).to include "を入力してください"
      end
    end

    context 'name_hiragana_rubyが空の場合' do
      it 'エラーが発生する' do
        expect(no_name_hiragana_ruby_song).to be_invalid
        expect(no_name_hiragana_ruby_song.errors.messages[:name_hiragana_ruby]).to include "を入力してください"
      end
    end

    context 'name_hiragana_rubyがひらがなではない場合' do
      it 'エラーが発生する' do
        expect(incorrect_name_hiragana_ruby_song).to be_invalid
        expect(incorrect_name_hiragana_ruby_song.errors.messages[:name_hiragana_ruby]).to include '全角ひらがなで入力して下さい。'
      end
    end

    context 'name_kana_rubyが空の場合' do
      it 'エラーが発生する' do
        expect(no_name_kana_ruby_song).to be_invalid
        expect(no_name_kana_ruby_song.errors.messages[:name_kana_ruby]).to include "を入力してください"
      end
    end

    context 'name_kana_rubyが全角カタカナ以外の場合' do
      it 'エラーが発生する' do
        expect(incorrect_name_kana_ruby_song).to be_invalid
        expect(incorrect_name_kana_ruby_song.errors.messages[:name_kana_ruby]).to include "全角カタカナで入力して下さい。"
      end
    end
  end
end
