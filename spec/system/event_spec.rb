require 'rails_helper'

RSpec.describe 'Events', type: :system do
  before do
    driven_by(:rack_test)
  end

  let(:user) { create(:user) }
  let(:event1) { create(:event, name: 'イベント1') }
  let(:event2) { create(:event, name: 'イベント2') }
  let(:event3) { create(:event, name: 'イベント3') }
  let(:event4) { create(:event, name: 'イベント4') }
  let(:tour) { create(:tour, name: 'ツアー1', event: event4) }

  describe '未ログイン時' do
    context 'イベント一覧ページにアクセスした時' do
      it 'イベント一覧ページが表示される' do
        visit events_path
        expect(page).to have_content('イベント一覧')
      end

      it 'イベントが表示される' do
        event1
        event2
        visit events_path
        expect(page).to have_content('イベント1')
        expect(page).to have_content('イベント2')
      end

      it 'イベントをクリックすると詳細ページに遷移する' do
        event1
        visit events_path
        click_link 'イベント1'
        expect(page).to have_current_path(event_path(event1))
      end
    end

    context 'イベント詳細ページにアクセスした時' do
      it 'イベント詳細ページが表示される' do
        visit event_path(event1)
        expect(page).to have_content('イベント1')
      end
    end
  end
end
