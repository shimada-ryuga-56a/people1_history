require 'rails_helper'

RSpec.describe 'AdminUsers', type: :system do
  before do
    driven_by(:rack_test)
  end

  let(:admin_user) { create(:admin_user) }

  describe '管理者として未ログイン時' do
    context '管理者ログインページにアクセスした時' do
      it 'ログインページが表示される' do
        visit new_admin_user_session_path
        expect(page).to have_current_path(new_admin_user_session_path)
      end

      it '管理者としてログインできる' do
        visit new_admin_user_session_path
        fill_in 'admin_user_email', with: admin_user.email
        fill_in 'admin_user_password', with: admin_user.password
        click_button 'ログイン'
        expect(page).to have_current_path(admin_root_path)
      end
    end
  end

  describe '管理者としてログイン時' do
    before do
      sign_in admin_user
    end

    context '管理者ログインページにアクセスした時' do
      it '管理者トップページにリダイレクトされる' do
        visit new_admin_user_session_path
        expect(page).to have_current_path(admin_root_path)
      end
    end
  end
end
