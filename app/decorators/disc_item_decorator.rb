class DiscItemDecorator < Draper::Decorator
  delegate_all

  def show_song_title
    disc_content.disc_version.disc.title
  end

  def show_disc_version
    disc_content.disc_version.version
  end

end
