require "rails_helper"

RSpec.describe "Events", type: :system do
  before do
    driven_by(:rack_test)
  end

  describe "未ログイン時" do
    context "イベント一覧ページにアクセスした時" do
      it "イベント一覧ページが表示される" do
        visit events_path
        expect(page).to have_content("イベントだよ")
      end
    end
  end
end