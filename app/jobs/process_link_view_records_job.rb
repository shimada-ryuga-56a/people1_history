class ProcessLinkViewRecordsJob < ApplicationJob
  queue_as :default

  def perform(*_args)
    CleanupPastViewRecordsJob.perform_now
    CreateLinkViewRecordJob.perform_now
    FetchYoutubeRecordJob.perform_now
  end
end
