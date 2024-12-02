class DiscItemDecorator < Draper::Decorator
  delegate_all

  def show_disc_title
    disc_content.disc_version.disc.title
  end

  def show_disc_version
    disc_content.disc_version.version
  end

  def show_event_title
    disc_content.event.name
  end

  def show_event_place
    disc_content.event.place
  end
end
