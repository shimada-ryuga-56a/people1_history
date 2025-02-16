namespace :job do
  desc "YouTubeAPIリクエストを送信する"
  task fetch_youtube_record: :environment do
    FetchYoutubeRecordJob.perform_now
  end
end
