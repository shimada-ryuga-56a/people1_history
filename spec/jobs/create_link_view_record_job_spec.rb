require 'rails_helper'

RSpec.describe CreateLinkViewRecordJob, type: :job do
  describe '正常系: メソッド' do
    context '2つのLinkViewCountレコードが存在する時' do
      it '100万以上の桁が同じであれば、LinkViewレコードが作成されない' do
        link = create(:link)
        create(:previous_link_view_count, link: link)
        create(:now_same_million_link_view_count, link: link)
        expect { CreateLinkViewRecordJob.perform_now }.to change(LinkView, :count).by(0)
      end
      it '100万以上の桁が異なれば、LinkViewレコードが作成される' do
        link = create(:link)
        create(:previous_link_view_count, link: link)
        create(:next_million_link_view_count, link: link)
        expect { CreateLinkViewRecordJob.perform_now }.to change(LinkView, :count).by(1)
      end
    end
  end
end
