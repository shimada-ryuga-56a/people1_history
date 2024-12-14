module SongsHelper
  def find_youtube_url(youtube_link)
    if youtube_link.include?('https://youtu.be/')
      youtube_link.gsub('https://youtu.be/', '')
    else
      youtube_link.gsub('https://www.youtube.com/watch?v=', '')
    end
  end

  def find_tiktok_id(tiktok_link)
    if tiktok_link.include?('https://www.tiktok.com')
      tiktok_link.gsub(/https:\/\/www.tiktok.com\/@.+\//, '').gsub(/\?is_from.+/, '')
    end
  end

  def find_video_id(tiktok_link)
    if tiktok_link.include?('https://www.tiktok.com')
      tiktok_link.gsub(/.+&web_id=/, '')
    end
  end
end
