class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: { safari: 15.0, chrome: 50, firefox: 121, ie: false }
  before_action :authenticate_user!
  before_action :any_unread_notice?

  private

  def any_unread_notice?
    return false unless user_signed_in?

    @unread_notice = Notice.find_by(from_whom_id: current_user, unread: true)
  end
end
