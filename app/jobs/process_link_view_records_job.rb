class ProcessLinkViewRecordsJob < ApplicationJob
  queue_as :default

  def perform(*_args)
    CreateLinkViewRecordJob.perform_now
    FetchYoutubeRecordJob.perform_now
  end
end
