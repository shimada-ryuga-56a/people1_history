class CleanupPastViewRecordsJob < ApplicationJob
  queue_as :default

  def perform(*args)
    @links = Link.all
    @links.each do |link|
      @link_view_counts = link.link_view_counts
      unless @link_view_counts.length > 2
        return
      end
      @records_for_cleanup = @link_view_counts[0..-3]
      @records_for_cleanup.each do |record|
        @link_view_count = LinkViewCount.find(record.id)
        @link_view_count.destroy
      end
    end
  end
end
