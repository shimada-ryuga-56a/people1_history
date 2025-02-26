namespace :job do
  desc 'YouTubeAPIリクエストを送信する'
  task fetch_youtube_record: :environment do
    FetchYoutubeRecordJob.perform_now
  end

  desc 'link_view_recordを作成する'
  task create_link_view_record: :environment do
    CreateLinkViewRecordJob.perform_now
  end

  desc 'YouTubeAPIリクエストでlink_view_recordを作成し、link_viewを作成する'
  task process_link_view_records: :environment do
    ProcessLinkViewRecordsJob.perform_now
  end
end
