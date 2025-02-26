class ProcessLinkViewRecordsJob < ApplicationJob
  queue_as :default

  def perform(*args)
    CreateLinkViewRecordJob.perform_now
    FetchYoutubeRecordJob.perform_now
  end
end
