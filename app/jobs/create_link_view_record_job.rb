class CreateLinkViewRecordJob < ApplicationJob
  queue_as :default

  def perform(*_args)
    @links = Link.where(platform: 'YouTube')
    @links.each do |link|
      @recent_view_counts = link.link_view_counts.last(2)
      next if @recent_view_counts.length < 2

      @now_view = @recent_view_counts[1]
      @now_view_count = @now_view.view_count
      @before_view_count = @recent_view_counts[0].view_count
      @now_view_count_million = @now_view_count / 1_000_000
      @before_view_count_million = @before_view_count / 1_000_000
      if increased_view_count?(@now_view_count_million, @before_view_count_million) && million_key_exist?(@now_view_count_million)
        link.link_views.create(date: @now_view.date, record_type: @now_view_count_million)
      end
    end
  end

  private

  def increased_view_count?(now_view_count_million, before_view_count_million)
    now_view_count_million > before_view_count_million
  end

  def million_key_exist?(now_view_count_million)
    LinkView.record_types.values.include?(now_view_count_million)
  end
end
