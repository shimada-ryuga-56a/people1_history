require 'rails_helper'

RSpec.describe CleanupPastViewRecordsJob, type: :job do
  let(:link) { create(:link) }
  let(:link_view_count1) { create(:link_view_count, link: link, view_count: 0, created_at: 20_200_101) }
  let(:link_view_count2) { create(:link_view_count, link: link, view_count: 10_000_000, created_at: 20_200_102) }
  let(:link_view_count3) { create(:link_view_count, link: link, view_count: 20_000_000, created_at: 20_200_103) }
  let(:link_view_count4) { create(:link_view_count, link: link, view_count: 30_000_000, created_at: 20_200_104) }

  describe '#perform' do
    context 'when there are more than 2 link_view_counts' do
      before do
        link_view_count1
        link_view_count2
        link_view_count3
        link_view_count4
      end

      it 'deletes the oldest records' do
        expect { CleanupPastViewRecordsJob.perform_now }.to change(LinkViewCount, :count).by(-2)
      end

      it 'does not delete the most recent records' do
        CleanupPastViewRecordsJob.perform_now
        expect(LinkViewCount.where(id: [link_view_count3.id, link_view_count4.id])).to exist
      end
    end

    context 'when there are 2 or fewer link_view_counts' do
      before do
        link_view_count1
        link_view_count2
      end

      it 'does not delete any records' do
        expect { CleanupPastViewRecordsJob.perform_now }.not_to change(LinkViewCount, :count)
      end
    end
  end
end
