module SongsHelper
  def find_youtube_url(youtube_link)
    if youtube_link.include?('https://youtu.be/')
      youtube_link.gsub('https://youtu.be/', '')
    else
      youtube_link.gsub('https://www.youtube.com/watch?v=', '')
    end
  end
end
