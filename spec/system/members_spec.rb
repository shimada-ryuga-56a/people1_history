require 'rails_helper'

RSpec.describe 'Members', type: :system do
  before do
    driven_by(:rack_test)
  end

  let(:user) { create(:user) }
  let(:member1) { create(:member, name: 'メンバー1', name_ruby: 'めんばー1') }
  let(:member2) { create(:member, name: 'メンバー2', name_ruby: 'めんばー2') }

  describe '未ログイン時' do
    context 'メンバー一覧ページにアクセスした時' do
      it 'ログインページへ遷移する' do
        visit members_path
        expect(page).to have_current_path(new_user_session_path)
      end
    end

    context 'メンバー詳細ページにアクセスした時' do
      it 'ログインページへ遷移する' do
        visit member_path(member1)
        expect(page).to have_current_path(new_user_session_path)
      end
    end
  end

  describe 'ログイン時' do
    before do
      sign_in user
    end

    context 'メンバー一覧ページにアクセスした時' do
      it 'メンバー一覧ページが表示される' do
        visit members_path
        expect(page).to have_content('メンバー一覧')
      end

      it 'メンバーが表示される' do
        member1
        member2
        visit members_path
        expect(page).to have_content('メンバー1')
        expect(page).to have_content('メンバー2')
      end

      it 'メンバーをクリックすると詳細ページに遷移する' do
        member1
        visit members_path
        click_link 'メンバー1'
        expect(page).to have_current_path(member_path(member1))
      end
    end

    context 'メンバー詳細ページにアクセスした時' do
      it 'メンバー詳細ページが表示される' do
        visit member_path(member1)
        expect(page).to have_content('めんばー1')
      end
    end
  end
end
