require 'rails_helper'

RSpec.describe 'Songs', type: :system do
  before do
    driven_by(:rack_test)
  end

  let(:user) { create(:user) }
  let(:song) { create(:song) }
  let(:song1) { create(:song, name: 'title_1', name_hiragana_ruby: 'あああ', name_kana_ruby: 'アアア') }
  let(:song2) { create(:song, name: 'title_2', name_hiragana_ruby: 'いいい', name_kana_ruby: 'イイイ') }

  describe '未ログイン時' do
    context '楽曲一覧ページにアクセスした時' do
      it '楽曲一覧ページが表示される' do
        visit songs_path
        expect(page).to have_content('楽曲一覧')
      end

      it '楽曲が表示される' do
        song1
        song2
        visit songs_path
        expect(page).to have_content('title_1')
        expect(page).to have_content('title_2')
      end

      it '楽曲をクリックすると詳細ページに遷移する' do
        song1
        visit songs_path
        click_link 'title_1'
        expect(page).to have_current_path(song_path(song1))
      end
    end

    context '楽曲詳細ページにアクセスした時' do
      it '楽曲詳細ページが表示される' do
        visit song_path(song1)
        expect(page).to have_content('title_1')
      end
    end
  end

  describe 'ログイン時' do
    before do
      sign_in user
    end

    context '楽曲一覧ページにアクセスした時' do
      it '楽曲一覧ページが表示される' do
        visit songs_path
        expect(page).to have_content('楽曲一覧')
      end

      it '楽曲が表示される' do
        song1
        song2
        visit songs_path
        expect(page).to have_content('title_1')
        expect(page).to have_content('title_2')
      end

      it '楽曲をクリックすると詳細ページに遷移する' do
        song1
        visit songs_path
        click_link 'title_1'
        expect(page).to have_current_path(song_path(song1))
      end
    end

    context '楽曲詳細ページにアクセスした時' do
      it '楽曲詳細ページが表示される' do
        visit song_path(song1)
        expect(page).to have_content('title_1')
      end
    end
  end
end
