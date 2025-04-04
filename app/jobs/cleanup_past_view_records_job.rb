class CleanupPastViewRecordsJob < ApplicationJob
  queue_as :default

  def perform(*_args)
    @links = Link.where(platform: 0)
    @links.each do |link|
      @link_view_counts = link.link_view_counts.order(created_at: :asc)
      if @link_view_counts.length < 3
        Rails.logger.debug 'link_view_countsの数が2以下のため、削除しません'
        next
      end
      Rails.logger.debug 'link_view_countsの数が2以上のため、削除します'
      @records_for_cleanup = @link_view_counts[0..-3]
      @records_for_cleanup.each do |record|
        @link_view_count = LinkViewCount.find(record.id)
        @link_view_count.destroy
      end
    end
  end
end
